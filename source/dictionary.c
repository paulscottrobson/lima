// *******************************************************************************************************************************
// *******************************************************************************************************************************
//
//		Name:		dictionary.c
//		Purpose:	Dictionary look up and search
//		Created:	2nd September 2022
//		Author:		Paul Robson (paul@robsons.org.uk)
//
// *******************************************************************************************************************************
// *******************************************************************************************************************************

#include "lima.h"

// *******************************************************************************************************************************
//
//											Raw bytes of the dictionary
//
// *******************************************************************************************************************************

#include "rawdictionary.h"

// *******************************************************************************************************************************
//
//										   Dictionary information structure
//
// *******************************************************************************************************************************

static DEFINITION definitions[MAXDEFINITIONS];

static int defineCount = 0;

// *******************************************************************************************************************************
//
//								 Initialise : Copy the raw information into the structure
//
// *******************************************************************************************************************************

void DICTInitialise(void) {
	defineCount = 0;
	BYTE8 *p = rawDictionary; 															// Scan through raw dictionary.
	while (*p != '\0') { 																// While more.
		int addr = p-rawDictionary+0x1000;
		definitions[defineCount].szName = p;											// Remember name
		while (*p != '\0') p++;  														// Skip name
		p++;
		definitions[defineCount].iBytes = *p++;  										// Bytes to copy
		definitions[defineCount].pCode = p;	 											// Where the code is.
		p += definitions[defineCount].iBytes; 											// Next record
		defineCount++; 																	// Bump count.
	}
}

// *******************************************************************************************************************************
//
//					Match a definition against a source line. The parameter text goes in the parameter
//
// *******************************************************************************************************************************

static int _DICTMatch(char *source,DEFINITION *def,char *parameter) {
	return  0;
}

// *******************************************************************************************************************************
//
//											Search the dictionary for the given code.
//
// *******************************************************************************************************************************

DEFINITION *DICTFind(char *source,char *parameter) {
	for (int i = 0;i < defineCount;i++) {
		if (_DICTMatch(source,&definitions[i],parameter)) {
			return &definitions[i];
		}
	}
	return NULL;
}

// *******************************************************************************************************************************
//												  Module Testing Code
// *******************************************************************************************************************************

#ifdef RUNALONE
int main(int argc,char *argv[]) {
	DICTInitialise();
	printf("Loaded %d definitions.\n",defineCount);
	return 0;
}
#endif