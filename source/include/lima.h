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

typedef unsigned char BYTE8;

#define MAXDEFINITIONS 	 	(256)

typedef struct _definition {
	unsigned char *szName; 		// ASCIIZ name
	int  iBytes; 				// Bytes of data included
	BYTE8 *pCode; 				// Pointer to code.
} DEFINITION;

void DICTInitialise(void);
DEFINITION *DICTFind(char *source,char *parameter);
