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

static int macroDataLow,macroDataHigh; 													// Data extracted from CODE_SETDATA

static int inProcedure; 																// True when in PROC .. ENDPROC

static int genStack[128];																// Stack for structures etc.
static int gsp;
static int nextVarLocation;																// Address of next variable location.

// *******************************************************************************************************************************
//
//										       Generation Initialise
//
// *******************************************************************************************************************************

void GENInitialise(void) {
	inProcedure = 0; 																	// Not in procedure
	gsp = 0;genStack[gsp] = 0x12345678; 												// Clear stack and put impossible value on it
	macroDataHigh = macroDataLow = 0; 													// Zero data
	nextVarLocation = 0x600;															// Put variables here.
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
	while (*param == ' ') param++;
	int e = 0;
	switch (code) {
		case EXEC_BYTEVAR:
		case EXEC_WORDVAR:
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
//										  	  Handle
//
// *******************************************************************************************************************************

static int _GENDefineVariable(int code,char *param,char *cmd) {
	int isByte = (code == EXEC_BYTEVAR);
	int e = 0;
	char *pComma = strchr(param,','); 													// Look for ,
	if (pComma != NULL) { 																// If found, split at comma
		*pComma = '\0';
		e = _GENDefineVariable(code,param,cmd); 										// Do first variable
		if (e != 0) return e;
		return _GENDefineVariable(code,pComma+1,cmd); 									// Do all the others recursively.
	}

	char *pAt = strchr(param,'@');														// Look for @ e.g. specifying address.
	int varAddr;
	char varType = (isByte ? 'C' : 'L'); 												// Variable is short or long word.

	if (pAt == NULL) { 																	// Not specified.
		if (!isByte && (nextVarLocation & 0xFF) == 0xFF) nextVarLocation++;				// Avoid words crossing the boundary.
		varAddr = nextVarLocation; 														// New address
		nextVarLocation = nextVarLocation + (isByte ? 1 : 2); 							// Adjust variable pointer
	} else {
		*pAt++ = '\0';																	// Split into name address (demo@$108 syntax)
		e = EVALEvaluate(pAt,&varAddr); 												// Var goes where ?
		if (e == 0) return ERR_IDENTIFIER;
		if (varAddr < 0x100) varType = (isByte ? 'S':'I');								// Can declare page zero variables.
	}
	return EVALAddIdentifier(param,varType,varAddr,inProcedure);						// Create the new identifier.
}

// *******************************************************************************************************************************
//
//										  	  Handle
//
// *******************************************************************************************************************************

static int _GENRepeatUntil(int code,char *param,char *cmd) {
	printf("%d %s %s\n",code,param,cmd);
	return 0;
}

// *******************************************************************************************************************************
//
//										  	  Handle
//
// *******************************************************************************************************************************

static int _GENForNextLoop(int code,char *param,char *cmd) {
	printf("%d %s %s\n",code,param,cmd);
	return 0;
}

// *******************************************************************************************************************************
//
//										  	  Handle
//
// *******************************************************************************************************************************

static int _GENConditional(int code,char *param,char *cmd) {
	printf("%d %s %s\n",code,param,cmd);
	return 0;
}

// *******************************************************************************************************************************
//
//										  	  Handle
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
			p = param+strlen(param)-2;
			if (strlen(param) < 3 || p[0] != '(' || p[1] != ')') return ERR_SYNTAX; 	// Badly formed.
			*p = '\0';																	// Remove ()
			EVALAddIdentifier(param,'P',a,0); 											// Add procedure.
			inProcedure = -1;															// Now in procedure.
			break;

		case EXEC_CALL:
			cmd += strlen(param); 														// Skip over the name of the procedure.
			t = EVALEvaluate(param,&a);													// Where do we call
			if (t != 'P') return ERR_NOPROC;
			if (*cmd++ != '(' || cmd[strlen(cmd)-1] != ')') return ERR_SYNTAX; 			// Check parameters.
			while (*cmd != ')') { 														// While more parameters.
				pCount++; 																// How many so far ?
				if (pCount == 3) return ERR_SYNTAX; 									// Too many !
				p2 = paramBuffer;
				*p2++ = (pCount == 1) ? 'R' : 'Y'; 										// 1st goes in R, 2nd in Y
				*p2++ = '=';
				while (*cmd != ',' && *cmd != ')') { 									// Copy parameter
					*p2++ = *cmd++;
				}
				*p2 = '\0';																// Make ASCIIZ
				if (*cmd == ',') cmd++;													// Skip comma
				e = GENGenerateCode(paramBuffer);										// Generate code to load R/Y				
				if (e) return e;
			}

			CODECall(a);																// Finally, call the routine.
			break;

		case EXEC_ENDPROC: 																// End a procedure
			if (inProcedure == 0) return ERR_PROC; 										// Not in procedure
			inProcedure = 0;															// Not any more.
			CODEReturn();																// Compile return code.
			break;
	}
	return e;
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
	printf("\t%04x : %02x %c [PATCH]\n",address,byte,(char)byte);
}

void CODECall(int addr) {
	CODEAppend(0x20);CODEAppend(addr & 0xFF);CODEAppend((addr >> 8) & 0xFF);
}

void CODEReturn(void) {
	CODEAppend(0x60);
}
//
//		Process the command lines.
//
static char *code[] = {
	"A=Y","A=42","R=542","R=$2A",
	"A=zbv.c","R=zwv.l","A=abv.c","R=awv.l",
	"A=4?","R=awv.l?",
	"myproc(3,2)",
	"++awv.l","A&7",
	"byte a,xx@$2A,yy","word w1,w2","R=xx","R=yy","R=w2",
	"proc test.1()","A=0","R=0","endproc",
	"test.1()","test.1(5)","test.1(1023,xx)",
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
	EVALAddIdentifier("myproc",'P',1224,0);

	int n = 0;
	while (code[n] != 0) {
		printf("--- %s ---\n",code[n]);
		int e = GENGenerateCode(code[n]);
		if (e != 0) printf("** ERROR %d **\n",e);
		printf("\n");
		n++;
	}

	EVALDump(stdout);
	return 0;
}
#endif
