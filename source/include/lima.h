// *******************************************************************************************************************************
// *******************************************************************************************************************************
//
//		Name:		lima.h 
//		Purpose:	General include file
//		Created:	2nd September 2022
//		Author:		Paul Robson (paul@robsons.org.uk)
//
// *******************************************************************************************************************************
// *******************************************************************************************************************************

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include <codesub.h>

//
//		Setup limits - very lazy storage, only really for PC.
//
#define MAXDEFINITIONS 	 	(512)	 										// Max no. of definitions.
#define MAXIDENTIFIERS  	(1024)											// Max no. of identifiers.
#define MAXIDENTLENGTH  	(24) 											// Max length of an identifier.

typedef unsigned char BYTE8;

#define ERROR(x) 			exit(fprintf(stderr,"Error:%s\n",x))
#define ASSERT(x)  			if (!(x)) exit(fprintf(stderr,"Assert:%s %d\n",__FILE__,__LINE__))

//
//		Structure holds a macro definition.
//
typedef struct _definition {		
	unsigned char *szName; 		// ASCIIZ name
	int  iBytes; 				// Bytes of data included
	BYTE8 *pCode; 				// Pointer to code.
} DEFINITION;

#define ERR_MATCH	(1) 		// Can't match code
#define ERR_ALIGN  	(2) 		// Low byte crosses page boundary.

//
//		Dictionary methods
//
void DICTInitialise(void);
DEFINITION *DICTFind(char *source,char **parameter);
//
//		Evaluate methods
//
void EVALInitialise(void);
void EVALAddIdentifier(char *szName,char cType,int value,int isLocal);
void EVALRemoveLocals(void);
unsigned char EVALEvaluate(char *x,int *result);
void EVALStrLower(char *s);
void EVALDump(FILE *f);
//
//		Code store methods
//
int CODEAppend(int byte);
void CODEPatch(int addr,int byte);
//
//		Generation methods
//
void GENInitialise(void);
int GENGenerateCode(char *code);