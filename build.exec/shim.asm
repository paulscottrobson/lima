		* = $8000
		jmp 	$8010
		.byte 	0
		.text 	"BASIC02",0

		* = $8010
		ldx 	#$FF
		txs
		lda 	#42
		jsr 	$FFD2

		lda 	1
		and 	#$F8
		sta 	1

		lda 	#15
		sta 	$D000
		lda 	#1
		sta 	$D100
		stz 	$D101
		stz 	$D102
		stz 	$D103

		inc 	1
		ldx 	#0
_SetupGlut:
		lda 	$F000,x
		sta 	$D000,x		
		sta 	$D100,x		
		sta 	$D200,x		
		sta 	$D300,x		
		sta 	$1000,x
		sta 	$4000,x
		sta 	$5000,x
		dex
		bne 	_SetupGlut

		ldx 	#0
halt:	bra 	halt

		* = $C000
		.binary "C256jr.bin"
