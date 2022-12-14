// *******************************************************************************************************************************
// *******************************************************************************************************************************
//
//		Name:		evaluate.c
//		Purpose:	Evaluate constants, identifiers etc.
//		Created:	2nd September 2022
//		Author:		Paul Robson (paul@robsons.org.uk)
//
// *******************************************************************************************************************************
// *******************************************************************************************************************************

#include "lima.h"

// *******************************************************************************************************************************
//
//										       	Identifier information
//
// *******************************************************************************************************************************

static struct {
	char szName[MAXIDENTLENGTH+1]; 														// ASCIIZ name lower case.
	int  iValue; 																		// Value associated with it
	unsigned char cType; 																// P S I L C B W (or '\0' if not in use)
	int  isLocal; 																		// True if scope is local.	
} Identifiers[MAXIDENTIFIERS];

// *******************************************************************************************************************************
//
//								 			  Initialise the identifiers.
//
// *******************************************************************************************************************************

void EVALInitialise(void) {
	for (int i = 0;i < MAXIDENTIFIERS;i++) {
		Identifiers[i].cType = 0;
	}
}

// *******************************************************************************************************************************
//
//													Remove all locals
//
// *******************************************************************************************************************************

void EVALRemoveLocals(void) {
	for (int i = 0;i < MAXIDENTIFIERS;i++) {
		if (Identifiers[i].cType != 0 && Identifiers[i].isLocal != 0) {
			Identifiers[i].cType = 0;
		}
	}
}

// *******************************************************************************************************************************
//
//										Remove all .prefixed identifiers (e.g. clean module)
//
// *******************************************************************************************************************************

void EVALCleanModule(void) {
	for (int i = 0;i < MAXIDENTIFIERS;i++) {
		if (Identifiers[i].cType != 0 && Identifiers[i].szName[0] == '.') {
			Identifiers[i].cType = 0;
		}
	}
}

// *******************************************************************************************************************************
//
//								Find a definition by name ; return Type, put in value
//
// *******************************************************************************************************************************

static unsigned char _EVALFind(char *x,int *result,int searchLocals) {
	char firstChar = tolower(x[0]);															// Speeds up search a bit
	for (int i = 0; i < MAXIDENTIFIERS;i++) { 												// Check all slots
		if (Identifiers[i].cType != 0 && Identifiers[i].szName[0] == firstChar) { 			// If in use and first char matches
			if ((searchLocals != 0) == (Identifiers[i].isLocal != 0)) { 					// Local or global scope search
				if (strcmp(Identifiers[i].szName,x) == 0) { 								// Check the name
					if (result != NULL) *result = Identifiers[i].iValue; 					// Matches, set value ?
					return Identifiers[i].cType;											// Return type
				}
			}
		}		
	}
	return 0;																				// Failed.
}

// *******************************************************************************************************************************
//
//												 Add a new identifier
//
// *******************************************************************************************************************************

int EVALAddIdentifier(char *szName,char cType,int value,int isLocal) {
	char buffer[MAXIDENTLENGTH+32];
	ASSERT(strlen(szName) <= MAXIDENTLENGTH);
	ASSERT(value >= 0 && value <= 0xFFFF);
	if (_EVALFind(szName,NULL,0) && isLocal == 0) return ERR_DUPLICATE; 					// DUplication (Global)
	if (_EVALFind(szName,NULL,-1)) return ERR_DUPLICATE; 									// Duplication (Local)
	int i;
	for (i = 0;i < MAXIDENTIFIERS && Identifiers[i].cType != 0;i++) { } 					// Find unused
	if (i == MAXIDENTIFIERS) ERROR("Too many identifiers");
	Identifiers[i].cType = cType; 															// Copy information in.
	Identifiers[i].iValue = value;
	Identifiers[i].isLocal = isLocal;
	strcpy(Identifiers[i].szName,szName);
	EVALStrLower(Identifiers[i].szName); 													// Force to lower case.
	for (int j = 0;j < strlen(Identifiers[i].szName);j++) { 								// Check alnum or .
		char c = Identifiers[i].szName[j];
		if (!isalnum(c) && c != '.') return ERR_IDENTIFIER;
	}
	if (strcmp(Identifiers[i].szName,"r") == 0) return ERR_IDENTIFIER;						// Cannot use R and A and Y
	if (strcmp(Identifiers[i].szName,"a") == 0) return ERR_IDENTIFIER;			
	if (strcmp(Identifiers[i].szName,"y") == 0) return ERR_IDENTIFIER;			
	return 0;
}

// *******************************************************************************************************************************
//
//											Dump definitions
//
// *******************************************************************************************************************************

void EVALDump(FILE *f) {
	for (int i = 0;i < MAXIDENTIFIERS;i++) { 
		if (Identifiers[i].cType != 0)
			fprintf(f,"%-32s $%04x [%c]\n",Identifiers[i].szName,Identifiers[i].iValue,Identifiers[i].cType);
	} 
}

// *******************************************************************************************************************************
//
//									    Convert string to lower case
//
// *******************************************************************************************************************************

void EVALStrLower(char *s) {
	while (*s != '\0') {
		*s = tolower(*s);
		s++;
	}
}

// *******************************************************************************************************************************
//
//									    String -> Integer, multiple bases
//
// *******************************************************************************************************************************

int _EVALDecodeInteger(char *s,int base,int *result) {
	int c = 0;
	while (*s != '\0') { 																	// More to process
		int d = 99; 																		// If not x digit will give error
		if (isxdigit(*s)) { 																// If xdigit
			d = toupper(*s) - ((toupper(*s) >= 'A') ? 'A'-10 : '0');			 			// Convert to 0..15
			c = c * base + d; 																// Adjust current number
			s++;
		}
		if (d >= base || c > 0xFFFF) ERROR("Bad number");									// Still legit.
	}
	*result = c; 																			// Return result.
	return (c < 256) ? 'B':'W';																// Return type
}

// *******************************************************************************************************************************
//
//												 Evaluate a string
//
// *******************************************************************************************************************************

unsigned char EVALEvaluate(char *x,int *result) {
	if (x[0] >= '0' and x[0] <= '9') {														// Decimal
		return _EVALDecodeInteger(x,10,result);
	}	
	if (x[0] == '$') {																		// Hexadecimal
		return _EVALDecodeInteger(x+1,16,result);
	}
	int n = _EVALFind(x,result,-1);if (n) return n; 										// Look up in locals
	return _EVALFind(x,result,0); 															// Look up identifier in globals
}

// *******************************************************************************************************************************
//
//												  Module Testing Code
//
// *******************************************************************************************************************************

#ifdef E_RUNALONE
//
//		Process the command lines.
//
int main(int argc,char *argv[]) {
	EVALInitialise();
	EVALAddIdentifier("abc",'L',42,0);
	EVALAddIdentifier("abc.2",'C',45,0);

	char cType;
	int n;
	cType = EVALEvaluate("abc",&n);
	if (cType != 0)
		printf("%c %d\n",cType,n);
	cType = EVALEvaluate("abc.2",&n);
	if (cType != 0)
		printf("%c %d\n",cType,n);
	cType = EVALEvaluate("abcd",&n);
	if (cType != 0)
		printf("%c %d\n",cType,n);
	cType = EVALEvaluate("42",&n);
	if (cType != 0)
		printf("%c %d\n",cType,n);
	cType = EVALEvaluate("$2b",&n);
	if (cType != 0)
		printf("%c %d\n",cType,n);
	cType = EVALEvaluate("542",&n);
	if (cType != 0)
		printf("%c %d\n",cType,n);
	EVALDump(stdout);		
	return 0;

}
#endif
