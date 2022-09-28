//
//	This code is automatically generated.
//
#define CODE_ISZERO (0x53)
#define CODE_LOW (0x63)
#define CODE_HIGH (0x73)
#define CODE_LOWPLUS1 (0x83)
#define CODE_SETDATA (0x93)
#define CODE_EXEC (0xa3)

#define EXEC_BYTEVAR (1)
#define EXEC_WORDVAR (2)
#define EXEC_ZEROBYTEVAR (3)
#define EXEC_ZEROWORDVAR (4)
#define EXEC_DICTIONARYCRUNCH (5)
#define EXEC_REPEAT (6)
#define EXEC_UNTIL (7)
#define EXEC_AFOR (8)
#define EXEC_RFOR (9)
#define EXEC_NEXT (10)
#define EXEC_IF (11)
#define EXEC_ELSE (12)
#define EXEC_ENDIF (13)
#define EXEC_PROCEDURE_DEF (14)
#define EXEC_CALL (15)
#define EXEC_ENDPROC (16)
#define EXEC_INLINE (17)

#define ISSUBST(c) ((c) == 0x53 || (c) == 0x63 || (c) == 0x73 || (c) == 0x83 || (c) == 0x93 || (c) == 0xa3)
