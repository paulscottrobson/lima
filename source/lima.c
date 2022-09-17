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
static int nCurrentLine; 																// Current line number
static char szCurrentFile[128];															// Current compiling file
static char *pszErrors[] = ERR_MSG;
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
//												Process command line options
//
// *******************************************************************************************************************************

static void _LIMCommandOption(char *cmd) {
	switch(tolower(cmd[1])) {
		case 'l':
			fListFile = fopen("__code.lst","w");
			listControl = 1;break;
		case 'c':
			codePointer = _LIMHexToInteger(cmd+2);
			codeBaseAddress = codePointer;
			break;
		case 'v':
			absVarStart = _LIMHexToInteger(cmd+2);
			GENSetVariableUsage(-1,absVarStart);
			break;
		case 'z':
			zeroVarStart = _LIMHexToInteger(cmd+2);
			GENSetVariableUsage(zeroVarStart,-1);
			break;
		default:
			ERROR("Unknown option");
	}
}

// *******************************************************************************************************************************
//
//									Process command line elment (or can be read from a file)
//
// *******************************************************************************************************************************

static int _LIMProcessCommand(char *cmd) {
	int e = 0;
	char szBuffer[256];

	if (cmd[0] == '-') {															// Command line options.
		_LIMCommandOption(cmd);
	} else { 																		// Process code file.
		strcpy(szCurrentFile,cmd);
		nCurrentLine = 0;															// Reset current line.
		FILE *f = fopen(szCurrentFile,"r");											// Open file
		if (f == NULL) return ERR_FILE; 											// Succeeded ?
		while (fgets(szBuffer,sizeof(szBuffer),f) != NULL && e == 0) {				// Scan through file.
			char *p = szBuffer;
			nCurrentLine += 1;
			while (*p != '\0' && e == 0) { 											// Scan through line.
				char *pNext = strchr(p,':');										// Followed by a : ?
				if (pNext != NULL) {
					*pNext = '\0';pNext++; 											// If so split it there
				} else {
					pNext = p+strlen(p);											// Last element
				}
				while (isspace(*p)) p++;											// Leading white space
				while (*p != '\0' && isspace(p[strlen(p)-1])) p[strlen(p)-1] = '\0';
				if (*p != '\0') {  													// If something
					if (listControl != 0) fprintf(fListFile,"%s\n",p); 				// Optional listing
					e = GENGenerateCode(p); 										// Generate code
				}
				//printf("%d %d [%s]\n",e,nCurrentLine,p);
				p = pNext;															// Go to next
			}
		}
	}
	return e;
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
	for (int i = 1;i < argc && e == 0;i++) {											// Process command line options
		e = _LIMProcessCommand(argv[i]);
		if (e != 0) fprintf(stderr,"%s (%s:%d)\n",pszErrors[e],szCurrentFile,nCurrentLine);
	}

	if (listControl != 0) { 															// Label dump & close listing file.
		FILE *f = fopen("__labels.lst","w");
		EVALDump(f);
		fclose(f);
		fclose(fListFile);
	}
	return e;
}
