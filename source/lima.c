// *******************************************************************************************************************************
// *******************************************************************************************************************************
//
//		Name:		lima.c
//		Purpose:	lime main program
//		Created:	11th September 2022
//		Author:		Paul Robson (paul@robsons.org.uk)
//
// *******************************************************************************************************************************
// *******************************************************************************************************************************

#include "lima.h"

static int zeroVarStart = DEFAULT_ZPAGE; 												// Zero Page vars from here
static int absVarStart = DEFAULT_ABS;													// Absolute address vars from here
static int codePointer = DEFAULT_CODE; 													// Code from here.
static int codeBaseAddress = DEFAULT_CODE;												// Base address
static FILE *fListFile = NULL;															// Listing file.
static int listControl = 0; 															// Non zero if listing.

static unsigned char program[MAXPROGSIZE]; 												// Code (offset from codePointer, at [0]

// *******************************************************************************************************************************
//
//								Append a byte (if >= 0), return address
//
// *******************************************************************************************************************************

int CODEAppend(int byte) {
	if (byte < 0) return codePointer;
	program[codePointer-codeBaseAddress] = byte;
	if (listControl != 0) fprintf(fListFile,"\t%04x : %02x %c\n",codePointer,byte,(byte > ' ' && byte < 0x80) ? (char)byte : '.');
	return codePointer++;
}

// *******************************************************************************************************************************
//
//								Back patch a byte (usually for Branch)
//
// *******************************************************************************************************************************

void CODEPatch(int addr,int byte) {
	if (listControl != 0) fprintf(fListFile,"\t%04x : %02x [PATCH]\n",addr,byte);
	program[addr-codeBaseAddress] = byte;
}

// *******************************************************************************************************************************
//
//							    Code to call a subroutine, may have paging
//
// *******************************************************************************************************************************

void CODECall(int addr) {
	CODEAppend(0x20);CODEAppend(addr & 0xFF);CODEAppend((addr >> 8) & 0xFF);
}

// *******************************************************************************************************************************
//
//							  Code to return from a subroutine, may have paging
//
// *******************************************************************************************************************************

void CODEReturn(void) {
	CODEAppend(0x60);
}

// *******************************************************************************************************************************
//
//											  Convert string to integer (hex)
//
// *******************************************************************************************************************************

static int _LIMHexToInteger(char *s) {
	int n = 0;
	while (*s != '\0') {
		if (!isxdigit(*s)) ERROR("Bad Hex Constant");
		char c = *s++;
		n = n * 16 + toupper(c) - '0' - (c <= '9' ? 0 : 7);
	}
	return n;
}

// *******************************************************************************************************************************
//
//													Main program
//
// *******************************************************************************************************************************

int main(int argc,char *argv[]) {
	int e = 0;
	GENInitialise();																	// Initialise the various modules.
	DICTInitialise();
	EVALInitialise();
	if (argc == 1) { 																	// No info prompt.
		printf("lime <options> <sources>\n");
		printf("\tv1.0 (11-09-2022) Written by Paul Robson\n");
		printf("\t-z<hex addr>    Set base address for zero page variables\n");
		printf("\t-v<hex addr>    Set base address for absolute variables\n");
		printf("\t-c<hex addr>    Set base address for code generation\n");
		printf("\t-l              Turn listing of generated code on\n");
		return 1;
	}
	for (int i = 1;i < argc;i++) {														// Process command line options
		if (argv[i][0] == '-') {
			switch(tolower(argv[i][1])) {
				case 'l':
					fListFile = fopen("__code.lst","w");
					listControl = 1;break;
				case 'c':
					codePointer = _LIMHexToInteger(argv[i]+2);
					codeBaseAddress = codePointer;
					break;
				case 'v':
					absVarStart = _LIMHexToInteger(argv[i]+2);
					GENSetVariableUsage(-1,absVarStart);
					break;
				case 'z':
					zeroVarStart = _LIMHexToInteger(argv[i]+2);
					GENSetVariableUsage(zeroVarStart,-1);
					break;
				default:
					ERROR("Unknown option");
			}
		} else { 																		// Process code file.

		}

	}
	GENGenerateCode("zbyte ww");
	GENGenerateCode("word vv");
	GENGenerateCode("proc a.start()");
	GENGenerateCode("A=42");
	GENGenerateCode("endproc");
	GENGenerateCode("R&vv");
	GENGenerateCode("a.start(511)");

	if (listControl != 0) {
		FILE *f = fopen("__labels.lst","w");
		EVALDump(f);
		fclose(f);
		fclose(fListFile);
	}
	return e;
}
