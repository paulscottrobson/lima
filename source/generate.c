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

static int macroDataLow,macroDataHigh; 													// Data extracted from CODE_SETDATA
static int inProcedure; 																// True when in PROC .. ENDPROC

// *******************************************************************************************************************************
//
//										       Generation Initialise
//
// *******************************************************************************************************************************

void GENInitialise(void) {
	inProcedure = 0;
	macroDataHigh = macroDataLow = 0; 													// Zero data
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
					ERROR("Unknown code");
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
	printf("%d %s %s\n",code,param,cmd);
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
	printf("\t%04x : %02x %c\n",address,byte,(char)byte);
	return address++;
}

void CODEPatch(int addr,int byte) {
	printf("\t%04x : %02x %c [PATCH]\n",address,byte,(char)byte);
}
//
//		Process the command lines.
//
static char *code[] = {
	"A=Y","A=42","R=542","R=$2A",
	"A=zbv.c","R=zwv.l","A=abv.c","R=awv.l",
	"A=4?","R=awv.l?","proc fred()",
	"myproc(3,2)",
	"++awv.l","A&7",
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
	return 0;
}
#endif
