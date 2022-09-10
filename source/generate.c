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
	printf("%04x : %02x %c\n",address,byte,(char)byte);
	return address++;
}

void CODEPatch(int addr,int byte) {
	printf("%04x : %02x %c [PATCH]\n",address,byte,(char)byte);
}
//
//		Process the command lines.
//
int main(int argc,char *argv[]) {

	DICTInitialise();
	EVALInitialise();

	EVALAddIdentifier("awv.l",'L',542,0);
	EVALAddIdentifier("abvc",'C',45,0);
	EVALAddIdentifier("zwvl",'S',542,0);
	EVALAddIdentifier("zbvc",'I',45,0);

	char cType;
	int n;
	cType = EVALEvaluate("awv.l",&n);
	if (cType != 0)
		printf("%c %d\n",cType,n);
	
	EVALDump(stdout);
	return 0;
}
#endif
