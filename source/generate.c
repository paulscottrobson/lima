// *******************************************************************************************************************************
// *******************************************************************************************************************************
//
//		Name:		generate.c
//		Purpose:	Code generator
//		Created:	10th September 2022
//		Author:		Paul Robson (paul@robsons.org.uk)
//
// *******************************************************************************************************************************
// *******************************************************************************************************************************

#include "lima.h"

static int _GENExecute(int code,char *param,char *cmd);
static int _GENDefineVariable(int code,char *param,char *cmd);
static int _GENRepeatUntil(int code,char *param,char *cmd);
static int _GENForNextLoop(int code,char *param,char *cmd);
static int _GENConditional(int code,char *param,char *cmd);
static int _GENProcedure(int code,char *param,char *cmd);
static int _GENCompileBranch(int opcode,int reverse);
static int _GENPatchBranch(int branchAddress,int targetAddress);

static int macroDataLow,macroDataHigh; 													// Data extracted from CODE_SETDATA

static int inProcedure; 																// True when in PROC .. ENDPROC

static int genStack[128];																// Stack for structures etc.
static int gsp;

static int nextVarLocation;																// Address of next variable locations
static int nextZeroLocation;

#define PUSH(n) 		genStack[++gsp] = (n)
#define POP() 			genStack[gsp--]
#define POPCHECK(m,e)	if (POP() != (m)) return (e)

// *******************************************************************************************************************************
//
//										       Generation Initialise
//
// *******************************************************************************************************************************

void GENInitialise(void) {
	inProcedure = 0; 																	// Not in procedure
	gsp = 0;genStack[gsp] = 0x12345678; 												// Clear stack and put impossible value on it
	macroDataHigh = macroDataLow = 0; 													// Zero data
	nextVarLocation = DEFAULT_ABS;														// Put variables here.
	nextZeroLocation = DEFAULT_ZPAGE;
}

// *******************************************************************************************************************************
//
//										       Set variable positions.
//
// *******************************************************************************************************************************

void GENSetVariableUsage(int zpBase,int absBase) {
	if (zpBase >= 0) nextZeroLocation = zpBase;
	if (absBase >= 0) nextVarLocation = absBase;
}

// *******************************************************************************************************************************
//
//										  Generate code for one instruction
//
// *******************************************************************************************************************************

int GENGenerateCode(char *code) {
	char *param = NULL;
	DEFINITION *d = DICTFind(code,&param);												// Do we recognise this
	if (d == NULL) return ERR_MATCH; 													// No

	int t,pValue = 0; 																	// Evaluate parameter if any.
	if (param != NULL) t = EVALEvaluate(param,&pValue);

	int xCode = 0; 																		// Track any execution.
	int e;
	int i = 0;
	while (i < d->iBytes) {
		int ocode = d->pCode[i++];
		if (ISSUBST(ocode)) {	 														// Code with substitution/information
			switch(ocode) {
				case CODE_LOW: 															// Low byte of address/constant
					CODEAppend(pValue & 0xFF);
					break;
				case CODE_HIGH: 														// High byte of address/constant
					CODEAppend(pValue >> 8);
					break;
				case CODE_LOWPLUS1: 													// Low byte of address + 1 for words.
					if ((pValue & 0xFF) == 0xFF) return ERR_ALIGN;
					CODEAppend((pValue+1) & 0xFF);
					break;
				case CODE_SETDATA:														// Set data for later use (e.g. conditional tests)
					macroDataLow = d->pCode[i++];											
					macroDataHigh = d->pCode[i++];											
					break;
				case CODE_EXEC:
					e = _GENExecute(d->pCode[i++],param,code);
					if (e != 0) return e;
					break;
				default:
					ERROR("Unknown substitute code");
			}
		} else {
			CODEAppend(ocode);
		}
	}
	return 0;
}

// *******************************************************************************************************************************
//
//										  	  Execute one internal command
//
// *******************************************************************************************************************************

static int _GENExecute(int code,char *param,char *cmd) {
	//printf(">> %d|%s|%s\n",code,param,cmd);
	while (*param == ' ') param++;
	int e = 0;
	switch (code) {
		case EXEC_BYTEVAR:
		case EXEC_WORDVAR:
		case EXEC_ZEROBYTEVAR:
		case EXEC_ZEROWORDVAR:
			e = _GENDefineVariable(code,param,cmd);
			break;
		case EXEC_REPEAT:
		case EXEC_UNTIL:
			e = _GENRepeatUntil(code,param,cmd);
			break;
		case EXEC_AFOR:
		case EXEC_RFOR:
		case EXEC_NEXT:
			e = _GENForNextLoop(code,param,cmd);
			break;
		case EXEC_IF:
		case EXEC_ELSE:
		case EXEC_ENDIF:
			e = _GENConditional(code,param,cmd);
			break;
		case EXEC_PROCEDURE_DEF:
		case EXEC_CALL:
		case EXEC_ENDPROC:
			e = _GENProcedure(code,param,cmd);
			break;
		case EXEC_DICTIONARYCRUNCH:
			EVALCleanModule();
			break;
		default:
			ERROR("Bad Execute Code");
	}
	return e;
}

// *******************************************************************************************************************************
//
//										 Split into comma seperated components
//
// *******************************************************************************************************************************

static char *words[128];

static char **GENSplitComma(char *text) {
	int eCount = 0;
	while (*text == ' ') text++;														// Skip initial spaces
	while (*text != '\0') { 															// Until more.
		words[eCount++] = text; 														// Record the word
		char *pComma = strchr(text,',');
		if (pComma == NULL) { 															// Last
			text = text+strlen(text);
		} else { 																		// More
			text = pComma+1;*pComma = '\0';
		}
		while (*text == ' ') text++;													// Skip initial spaces
	}
	words[eCount] = NULL;																// End of list.
	return words;
}

// *******************************************************************************************************************************
//
//										  	  Handle Variable Definitions
//
// *******************************************************************************************************************************

static int _GENDefineOneVariable(int code,char *param);

static int _GENDefineVariable(int code,char *param,char *cmd) {
	while (*cmd > ' ') cmd++;	 														// Skip over the keyword
	char **words = GENSplitComma(cmd); 													// Split words by command.
	int n = 0;
	while (words[n] != NULL) {
		printf("[%s]\n",words[n]);
		int e = _GENDefineOneVariable(code,words[n]);
		if (e != 0) return e;
		n++;
	}
	return 0;
}

// *******************************************************************************************************************************
//
//										  	  Define one variable
//
// *******************************************************************************************************************************

static int _GENDefineOneVariable(int code,char *param) {
	int isByte = (code == EXEC_BYTEVAR || code == EXEC_ZEROBYTEVAR);
	char *pAt = strchr(param,'@');														// Look for @ e.g. specifying address.
	int varAddr;
	char varType = (isByte ? 'C' : 'L'); 												// Variable is absolute byte and word
	if (code == EXEC_ZEROBYTEVAR) varType = 'S'; 										// Zero page byte and words.
	if (code == EXEC_ZEROWORDVAR) varType = 'I';

	if (pAt == NULL) { 																	// Not specified.
	 	int *pvAddr = (code == EXEC_ZEROBYTEVAR || code == EXEC_ZEROWORDVAR) ? 			// Where do we get it from.
	 													&nextZeroLocation : &nextVarLocation;
	 	if (!isByte && (*pvAddr & 0xFF) == 0xFF) {										// Avoid words crossing the boundary.
	 		if (code == EXEC_ZEROBYTEVAR) return ERR_ZPAGE;								// Out of zero page memory.
	 		(*pvAddr)++;				
	 	}
	 	varAddr = (*pvAddr); 															// New address
		(*pvAddr) += (isByte ? 1 : 2); 													// Adjust variable pointer
	} else {
	 	*pAt++ = '\0';																	// Split into name address (demo@$108 syntax)
	 	int e = EVALEvaluate(pAt,&varAddr); 											// Var goes where ?
	 	if (e == 0) return ERR_IDENTIFIER;
	 	if (varAddr < 0x100) varType = (isByte ? 'S':'I');								// Can declare page zero variables.
	}
	return EVALAddIdentifier(param,varType,varAddr,inProcedure);						// Create the new identifier.
}

// *******************************************************************************************************************************
//
//										  	  Handle Repeat/Until
//
// *******************************************************************************************************************************

static int _GENRepeatUntil(int code,char *param,char *cmd) {
	int target;
	switch(code) {
		case EXEC_REPEAT:																// Repeat pushes marker and address
			PUSH(CODEAppend(-1));
			PUSH(EXEC_REPEAT);
			break;
		case EXEC_UNTIL:
			POPCHECK(EXEC_REPEAT,ERR_REPEAT);											// Check nesting
			target = _GENCompileBranch(macroDataLow,-1); 								// Code to branch here.
			if (_GENPatchBranch(target,POP())) return ERR_GAP;							// And patch it
			break;
	}
	return 0;
}

// *******************************************************************************************************************************
//
//										  	  Handle [AR]For Next
//
// *******************************************************************************************************************************

static int _GENForNextLoop(int code,char *param,char *cmd) {
	int branch,loop;
	switch(code) {
		case EXEC_AFOR:																	// If patches a skip branch and pushes IF
			loop = CODEAppend(0x3A);													// DEC A
			CODEAppend(0x48);															// PHA
			PUSH(loop);PUSH(EXEC_AFOR);													// Set state.
			break;
		case EXEC_RFOR:
			loop = CODEAppend(0xC9);CODEAppend(0x00);									// CMP #0
			CODEAppend(0xD0);CODEAppend(0x01);											// BNE *+1
			CODEAppend(0xCA);															// DEX
			CODEAppend(0x3A);															// DEC A
			CODEAppend(0xDA);															// PHX
			CODEAppend(0x48);															// PHA
			PUSH(loop);PUSH(EXEC_RFOR);													// Set state.
			break;
		case EXEC_NEXT:
			switch(POP()) { 															// Which loop code ?
				case EXEC_RFOR:
					CODEAppend(0x68);													// PLA
					CODEAppend(0xFA);													// PLX
					loop = POP();
					branch = _GENCompileBranch(0xD0,0);_GENPatchBranch(branch,loop); 	// BNE <back>
					CODEAppend(0xC9);CODEAppend(0x00);									// CMP #0
					branch = _GENCompileBranch(0xD0,0);_GENPatchBranch(branch,loop); 	// BNE <back>
					break;
				case EXEC_AFOR:
					CODEAppend(0x68);													// PLA
					branch = _GENCompileBranch(0xD0,0);_GENPatchBranch(branch,POP());	// BNE <loop>
					break;
				default:
					return ERR_FOR;
					break;
			}
			break;
		}
	return 0;
}

// *******************************************************************************************************************************
//
//										  	  Handle IF ELSE ENDIF
//
// *******************************************************************************************************************************

static int _GENConditional(int code,char *param,char *cmd) {
	int branch,target;
	switch(code) {
		case EXEC_IF:																	// If patches a skip branch and pushes IF
			branch = _GENCompileBranch(macroDataLow,1);									// Compare a reversed branch (e.g. on fail)
			PUSH(branch);PUSH(EXEC_IF);													// Push If
			break;
		case EXEC_ELSE:
			POPCHECK(EXEC_IF,ERR_IF);													// Patch forward branch and reset.			
			branch = _GENCompileBranch(0x80,0);		 									// Else exit [BRA]
			_GENPatchBranch(POP(),CODEAppend(-1));
			PUSH(branch);PUSH(EXEC_IF);													// Push the else branch.
			break;
		case EXEC_ENDIF:
			POPCHECK(EXEC_IF,ERR_IF);													// Patch forward branch.
			_GENPatchBranch(POP(),CODEAppend(-1));
			break;
		}
	return 0;
}

// *******************************************************************************************************************************
//
//										  	  Handle Procedure and Calls
//
// *******************************************************************************************************************************

static int _GENProcedure(int code,char *param,char *cmd) {
	int a,t,e = 0;
	char *p,*p2,paramBuffer[64];
	int pCount = 0;
	switch (code) {
		case EXEC_PROCEDURE_DEF:														// Defining a procedure.
			if (inProcedure) return ERR_PROC;
			a = CODEAppend(-1);															// Get address.
			param = cmd+4;
			while (*param == ' ') param++;
			p = param+strlen(param)-2;
			if (strlen(param) < 3 || p[0] != '(' || p[1] != ')') return ERR_SYNTAX; 	// Badly formed.
			*p = '\0';																	// Remove ()
			EVALAddIdentifier(param,'P',a,0); 											// Add procedure.
			inProcedure = -1;															// Now in procedure.
			if (strcmp(param,"main") == 0) { 											// Fix up main.
				CODEPatchStartup(a);
			}
			break;

		case EXEC_CALL:
			p = strchr(cmd,'(');*p++ = '\0';											// Get the procedure name
			//printf("[%s] %c\n",cmd,*cmd);
			t = EVALEvaluate(cmd,&a);													// Where do we call
			if (t != 'P') return ERR_NOPROC;
			if (p[strlen(p)-1] != ')') return ERR_SYNTAX; 								// Check closing bracket
			while (*p != ')') { 														// While more parameters.
				pCount++; 																// How many so far ?
				if (pCount == 3) return ERR_SYNTAX; 									// Too many !
				p2 = paramBuffer;
				*p2++ = (pCount == 1) ? 'R' : 'Y'; 										// 1st goes in R, 2nd in Y
				*p2++ = '=';
				while (*p != ',' && *p != ')') { 										// Copy parameter
					*p2++ = *p++;
				}
				*p2 = '\0';																// Make ASCIIZ
				if (*p == ',') p++;														// Skip comma
				e = GENGenerateCode(paramBuffer);										// Generate code to load R/Y				
				if (e) return e;
			}
			CODECall(a);																// Finally, call the routine.
			break;

		case EXEC_ENDPROC: 																// End a procedure			
			if (inProcedure == 0) return ERR_PROC; 										// Not in procedure
			if (gsp != 0) return ERR_STRUCT;											// Unclosed structure
			inProcedure = 0;															// Not any more.
			EVALRemoveLocals();															// Forget any locals
			CODEReturn();																// Compile return code.
			break;
	}
	return e;
}

// *******************************************************************************************************************************
//
//										  	  Create & Patch branches
//
// *******************************************************************************************************************************

static int _GENCompileBranch(int opcode,int reverse) {
	int branchAddress = CODEAppend(opcode ^ (reverse ? 0x20 : 0x00));					// Output branch, inverting if required
	CODEAppend(0); 																		// Dummy branch distance.
	return branchAddress;
}

static int _GENPatchBranch(int branchAddress,int targetAddress) {
	int offset = targetAddress - (branchAddress+2);										// Offset
	if (offset < -128 || offset > 127) return -1;										// Out of range.
	CODEPatch(branchAddress+1,offset & 0xFF);											// Patch the branch
	return 0;
}

// *******************************************************************************************************************************
//
//												  Module Testing Code
//
// *******************************************************************************************************************************

#ifdef G_RUNALONE

//
//		Dummy code generators.
//
int address = 0x1000;

int CODEAppend(int byte) {
	if (byte < 0) return address;
	printf("\t%04x : %02x %c\n",address,byte,(char)byte);
	return address++;
}

void CODEPatch(int addr,int byte) {
	printf("\t%04x : %02x %c [PATCH]\n",addr,byte,(char)byte);
}

void CODECall(int addr) {
	CODEAppend(0x20);CODEAppend(addr & 0xFF);CODEAppend((addr >> 8) & 0xFF);
}

void CODEReturn(void) {
	CODEAppend(0x60);
}

void CODEPatchStartup(int addr) {}
//
//		Process the command lines.
//
static char *code[] = {
	"A=Y","A=42","R=542","R=$2A",
	"A=zbv.c","R=zwv.l","A=abv.c","R=awv.l",
	"A=4?","R=awv.l?",
	"++awv.l","A&7",
	"byte w,x",
	"byte ax,xx@$2A,yy","word w1,w2","R=xx","R=yy","R=w2",
	"zbyte zb","zword zw","R=zw","A=zb",
	"proc test.1()","word c","R+c","R=c","endproc",
	"test.1()","test.1(5)","test.1(1023,xx)",
	"repeat","--A","A=4?","until",
	"A=2?","if","A=5","else","++A","endif",
	"R=5","r.FOR","NEXT",
	"byte aaa42@$D100,bbb42@$D101","byte tst1,tst2",
	NULL
};

int main(int argc,char *argv[]) {

	GENInitialise();
	DICTInitialise();
	EVALInitialise();

	EVALAddIdentifier("awv.l",'L',542,0);
	EVALAddIdentifier("abv.c",'C',45,0);
	EVALAddIdentifier("zwv.l",'I',542,0);
	EVALAddIdentifier("zbv.c",'S',45,0);
	EVALAddIdentifier(".myproc",'P',1224,0);

	int n = 0;
	while (code[n] != 0) {
		char buffer[128];
		strcpy(buffer,code[n]);
		printf("--- %s ---\n",buffer);
		int e = GENGenerateCode(buffer);
		if (e != 0) printf("** ERROR %d **\n",e);
		printf("\n");
		n++;
	}

	EVALDump(stdout);
	return 0;
}
#endif
