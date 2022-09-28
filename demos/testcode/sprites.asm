;
;		Sprites test program, Junior 256
;
;		Runs from $8000 using the TinyKernel, which has Gadget's GLUT set up code incorporated in it. 
;
;		Tested on 23/09/22 FPGA.
;
;		See https://github.com/paulscottrobson/lima/demos for make/upload.
;
zTemp0 = $80

		* = $8000

		stz 	0 							; allow access to I/O ports.

		lda 	#$2F 						; enable Text, Overlay, Graphic, Bitmap and Sprite Engine
		sta 	$D000

		lda 	#1 							; enable bitmap
		sta 	$D100

		stz 	$D101 						; display bitmap using 000000, e.g. the current memory.		
		stz 	$D102
		stz 	$D103		

		ldx 	#0 							; clear the whole sprite area
spclear:
		stz 	$D900,x
		stz 	$DA00,x
		dex
		bne 	spclear		

		lda 	#$20 						; fill most of upper half of screen with dark red.
		sta 	zTemp0
		sta 	zTemp0+1
bmclear:
		lda 	#$20
		sta 	(zTemp0)
		inc 	zTemp0
		bne 	bmclear
		inc 	zTemp0+1
		bpl 	bmclear

; **************************************************************************************************************		
;
;		This is the address of the sprite record. It appears to work for every tried address $D908-$DAF8
;		with nothing else changed.
;		
;		However $D900 does not work.
;		
; **************************************************************************************************************

		spriteAddress = $D900

		ldx 	#0

spriteloop:
		lda 	#1 							; enable, 32x32 pixels, top level
		sta 	spriteAddress+0,x

		stz 	spriteAddress+1,x			; makes graphic data address the monitor code, something to see :)
		lda 	#$80 			 			; will come out as a speckly rectangle because there's code at $008000
		sta 	spriteAddress+2,x 			; this code :)
		stz 	spriteAddress+3,x

		txa				 					; roughly X centred
		asl 	a
		asl 	a
		adc 	#32

		sta 	spriteAddress+4,x
		stz 	spriteAddress+5,x

		txa 
		lsr 	a
		adc 	#$40
		sta 	spriteAddress+6,x
		stz 	spriteAddress+7,x

		txa
		clc
		adc 	#8
		tax
		cpx 	#10*8
		bne 	spriteloop
halt:	bra 	halt
