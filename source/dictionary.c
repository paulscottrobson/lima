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
		ASSERT(defineCount < MAXDEFINITIONS); 											// Too many check.
		int addr = p-rawDictionary+0x1000;
		definitions[defineCount].szName = p;											// Remember name
		while (*p != '\0') p++;  														// Skip name
		p++;
		definitions[defineCount].iBytes = *p++;  										// Bytes to copy
		ASSERT(definitions[defineCount].iBytes < 16);									// Sanity check
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

static char *_DICTExtractParameter(char *src,char *buffer,char requiredType,char endSequence);

static char szParamBuffer[64]; 															// Parameter buffer

static int _DICTMatch(char *source,DEFINITION *def,char **parameter) {
	szParamBuffer[0] = '\0'; 															// Initially return an empty buffer
	*parameter = szParamBuffer;
	unsigned char *match = def->szName; 												// Compare p against source.
	while (*source != '\0' && *match != '\0' && *match != '*') { 						// While end of one string, or match is *
		if (isupper(*match)) { 															// Found a parameter.
			char paramType = *match++; 													// Type required
			source = _DICTExtractParameter(source,szParamBuffer,paramType,*match); 		// Extract a parameter
			if (source == NULL) return 0; 												// Failed.
		} else {
			if (tolower(*source) != tolower(*match)) return 0; 							// Match failed.
			source++;match++;
		}
	}
	if (*source == '\0' && *match == '\0') return -1; 									// Matched both strings completely
	if (*match != '*') return 0; 														// Matched the partial ?
	return -1;
}

static char *_DICTExtractParameter(char *src,char *buffer,char requiredType,char endSequence) {
	char *p = buffer;
	int v;
	while (*src != '\0' && *src != endSequence) { 										// While not got the parameter
		*p++ = *src++;
	}
	*p = '\0'; 																			// Make ASCIIZ
	if (*src != endSequence) return NULL; 												// Not found the end marker.
	char paramType = EVALEvaluate(buffer,&v); 							 				// Evaluate the parameter
	return (paramType == requiredType) ? src:NULL;
}

// *******************************************************************************************************************************
//
//											Search the dictionary for the given code.
//
// *******************************************************************************************************************************

DEFINITION *DICTFind(char *source,char **parameter) {
	*parameter = NULL;																	// Erase parameter
	for (int i = 0;i < defineCount;i++) { 												// Try each in order.
		if (_DICTMatch(source,&definitions[i],parameter)) { 							// Return definition if matched.
			return &definitions[i];
		}
	}
	return NULL; 																		// Fail.
}

// *******************************************************************************************************************************
//
//												  Module Testing Code
//
// *******************************************************************************************************************************

#ifdef D_RUNALONE
//
//		A dummy evaluate replacement - int constants -> B,W . SILC are the type followed by integer address e.g. S42 is S @ $2A
//
unsigned char EVALEvaluate(char *x,int *result) {
	if (isdigit(*x)) {
		*result = atoi(x);
		return (*result < 256) ? 'B':'W';
	}
	*result = atoi(x+1);
	return toupper(x[0]);
}
//
//		Try one
//
static void doOneMatch(char *text) {
	char *param;
	DEFINITION *d = DICTFind(text,&param);		
	if (d != NULL)
		printf("%s\n\t%s %d {%s}\n",text,d->szName,d->iBytes,(param == NULL) ? "[NULL]":param);
	else
		printf("%s failed.\n",text);
}
//
//		Process the command lines.
//
int main(int argc,char *argv[]) {
	DICTInitialise();
	printf("Loaded %d definitions.\n",defineCount);
	for (int i = 1;i < argc;i++) {
		doOneMatch(argv[i]);
	}
	return 0;
}
#endif