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

static int _DICTMatch(char *source,DEFINITION *def,char **parameter) {
	static char szParamBuffer[MAXIDENTLENGTH+1]; 										// Buffer for the parameter.
	int paramPos = 0;
	int v;
	*parameter = szParamBuffer; 														// Return the parameter buffer, with initial NULL
	szParamBuffer[0] = '\0';
	unsigned char *p = def->szName; 													// Compare p against source.
	while (*p != '\0' && *p != '*') { 													// While still matching against the type and not wildcard	
		if (isupper(*p)) { 																// Wild card ?
			char type = *p++; 															// Get the type.
			paramPos = 0; 																// Reset parameter fetch
			while (*source != *p) { 													// Until found match with next character
				ASSERT(paramPos < MAXIDENTLENGTH);
				if (*source == '\0') return 0; 											// End of line, fail, doesn't match.
				szParamBuffer[paramPos++] = tolower(*source); 							// Otherwise keep copying into the buffer.	
				source++;
			}
			szParamBuffer[paramPos++] = '\0';											// Fix parameter to ASCIIZ
			return (EVALEvaluate(szParamBuffer,&v) == type); 							// Evaluate, Types match, okay, else fail.
		} else { 																		// Any other character
			if (*p != tolower(*source)) return 0; 										// Reject if different.
			p++;source++; 																// Advance for next
		}
	}
	if (*p == '*') { 																	// Wildcard, grab the rest of the line.
		paramPos = 0; 																	// For things like proc and byte
		while (*source != '\0') { 														// Consume all the source.
			ASSERT(paramPos < MAXIDENTLENGTH);
			szParamBuffer[paramPos++] = *source++;
		}
		szParamBuffer[paramPos] = '\0'; 												// Make string ASCIIZ.
	}
	return (*source == '\0'); 															// True if grabbed everything.
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
//												  Module Testing Code
// *******************************************************************************************************************************

#ifdef RUNALONE
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
//		Process the command lines.
//
int main(int argc,char *argv[]) {
	DICTInitialise();
	printf("Loaded %d definitions.\n",defineCount);
	int todo = 1; 																		// Make high to time how long it runs
	for (int c = 0;c < todo;c++) { 														// On this machine 100k takes about 1s.
		for (int i = 1;i < argc;i++) {
			char *param;
			DEFINITION *d = DICTFind(argv[i],&param);		
			if (todo == 1) {
				if (d != NULL)
					printf("%s\n\t%s %d {%s}\n",argv[i],d->szName,d->iBytes,(param == NULL) ? "[NULL]":param);
				else
					printf("%s failed.\n",argv[i]);
			}
		}		
	}
	return 0;
}
#endif