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
	if (argc == 1) {
		printf("lime <options> <sources>\n");
		printf("\tv1.0 Written by Paul Robson 2022\n");
		printf("\t-z<hex addr>    Set base address for zero page variables\n");
		printf("\t-v<hex addr>    Set base address for absolute variables\n");
		printf("\t-c<hex addr>    Set base address for code generation\n");
		printf("\t-l              Turn listing of generated code on\n");
		e = 1;
	}




	return e;
}
