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

		spriteAddress = $D908

		lda 	#1 							; enable, 32x32 pixels, top level
		sta 	spriteAddress+0

		stz 	spriteAddress+1				; makes graphic data address the monitor code, something to see :)
		lda 	#$80 			 			; will come out as a speckly rectangle because there's code at $008000
		sta 	spriteAddress+2 			; this code :)
		stz 	spriteAddress+3

		lda 	#$A0 						; roughly X centred
		sta 	spriteAddress+4
		stz 	spriteAddress+5

		lda 	#$40 						; in the dark red area.
		sta 	spriteAddress+6
		stz 	spriteAddress+7
halt:	bra 	halt
