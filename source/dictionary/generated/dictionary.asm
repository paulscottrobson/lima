;
;	This code is automatically generated.
;
	* = $1000

; ***** clean.module *****

	.byte	$63,$6c,$65,$61,$6e,$2e,$6d,$6f,$64,$75,$6c,$65,0
	.byte	EndCode1000-*-1
	.byte	$a3,$05
EndCode1000:

; ***** interruptoff *****

	.byte	$69,$6e,$74,$65,$72,$72,$75,$70,$74,$6f,$66,$66,0
	.byte	EndCode1001-*-1
	sei
EndCode1001:

; ***** interrupt.on *****

	.byte	$69,$6e,$74,$65,$72,$72,$75,$70,$74,$2e,$6f,$6e,0
	.byte	EndCode1002-*-1
	cli
EndCode1002:

; ***** endproc *****

	.byte	$65,$6e,$64,$70,$72,$6f,$63,0
	.byte	EndCode1003-*-1
	.byte	$a3,$10
EndCode1003:

; ***** I[y]=a *****

	.byte	$49,$5b,$79,$5d,$3d,$61,0
	.byte	EndCode1004-*-1
	sta  ($63 & $FF),y
EndCode1004:

; ***** I[y]=r *****

	.byte	$49,$5b,$79,$5d,$3d,$72,0
	.byte	EndCode1005-*-1
	sta  ($63 & $FF),y
	iny
	txa
	sta  ($63 & $FF),y
	dey
	lda  ($63 & $FF),y
EndCode1005:

; ***** L[y]=a *****

	.byte	$4c,$5b,$79,$5d,$3d,$61,0
	.byte	EndCode1006-*-1
	sta  ($7363 & $FF),y
EndCode1006:

; ***** L[y]=r *****

	.byte	$4c,$5b,$79,$5d,$3d,$72,0
	.byte	EndCode1007-*-1
	sta  ($7363 & $FF),y
	iny
	txa
	sta  ($7363 & $FF),y
	dey
	lda  ($7363 & $FF),y
EndCode1007:

; ***** a^I[y] *****

	.byte	$61,$5e,$49,$5b,$79,$5d,0
	.byte	EndCode1008-*-1
	eor  ($63 & $FF),y
EndCode1008:

; ***** a^L[y] *****

	.byte	$61,$5e,$4c,$5b,$79,$5d,0
	.byte	EndCode1009-*-1
	eor  ($7363 & $FF),y
EndCode1009:

; ***** a-I[y] *****

	.byte	$61,$2d,$49,$5b,$79,$5d,0
	.byte	EndCode1010-*-1
	sec
	sbc  ($63& $FF),y
EndCode1010:

; ***** a-L[y] *****

	.byte	$61,$2d,$4c,$5b,$79,$5d,0
	.byte	EndCode1011-*-1
	sec
	sbc  ($7363& $FF),y
EndCode1011:

; ***** a|I[y] *****

	.byte	$61,$7c,$49,$5b,$79,$5d,0
	.byte	EndCode1012-*-1
	ora  ($63& $FF),y
EndCode1012:

; ***** a|L[y] *****

	.byte	$61,$7c,$4c,$5b,$79,$5d,0
	.byte	EndCode1013-*-1
	ora  ($7363& $FF),y
EndCode1013:

; ***** a&I[y] *****

	.byte	$61,$26,$49,$5b,$79,$5d,0
	.byte	EndCode1014-*-1
	and  ($63& $FF),y
EndCode1014:

; ***** a&L[y] *****

	.byte	$61,$26,$4c,$5b,$79,$5d,0
	.byte	EndCode1015-*-1
	and  ($7363& $FF),y
EndCode1015:

; ***** a+I[y] *****

	.byte	$61,$2b,$49,$5b,$79,$5d,0
	.byte	EndCode1016-*-1
	clc
	adc  ($63& $FF),y
EndCode1016:

; ***** a+L[y] *****

	.byte	$61,$2b,$4c,$5b,$79,$5d,0
	.byte	EndCode1017-*-1
	clc
	adc  ($7363& $FF),y
EndCode1017:

; ***** a=I[y] *****

	.byte	$61,$3d,$49,$5b,$79,$5d,0
	.byte	EndCode1018-*-1
	lda  ($63 & $FF),y
EndCode1018:

; ***** a=L[y] *****

	.byte	$61,$3d,$4c,$5b,$79,$5d,0
	.byte	EndCode1019-*-1
	lda  ($7363 & $FF),y
EndCode1019:

; ***** cpu->s *****

	.byte	$63,$70,$75,$2d,$3e,$73,0
	.byte	EndCode1020-*-1
	pha
	phx
	phy
EndCode1020:

; ***** r^I[y] *****

	.byte	$72,$5e,$49,$5b,$79,$5d,0
	.byte	EndCode1021-*-1
	eor  ($63 & $FF),y
	pha
	txa
	iny
	eor  ($63 & $FF),y
	dey
	tax
	pla
EndCode1021:

; ***** r^L[y] *****

	.byte	$72,$5e,$4c,$5b,$79,$5d,0
	.byte	EndCode1022-*-1
	eor  ($7363 & $FF),y
	pha
	txa
	iny
	eor  ($7363 & $FF),y
	dey
	tax
	pla
EndCode1022:

; ***** r-I[y] *****

	.byte	$72,$2d,$49,$5b,$79,$5d,0
	.byte	EndCode1023-*-1
	sec
	sbc  ($63& $FF),y
	pha
	txa
	iny
	sbc  ($63& $FF),y
	dey
	tax
	pla
EndCode1023:

; ***** r-L[y] *****

	.byte	$72,$2d,$4c,$5b,$79,$5d,0
	.byte	EndCode1024-*-1
	sec
	sbc  ($7363& $FF),y
	pha
	txa
	iny
	sbc  ($7363& $FF),y
	dey
	tax
	pla
EndCode1024:

; ***** r|I[y] *****

	.byte	$72,$7c,$49,$5b,$79,$5d,0
	.byte	EndCode1025-*-1
	ora  ($63& $FF),y
	pha
	txa
	iny
	ora  ($63& $FF),y
	dey
	tax
	pla
EndCode1025:

; ***** r|L[y] *****

	.byte	$72,$7c,$4c,$5b,$79,$5d,0
	.byte	EndCode1026-*-1
	ora  ($7363& $FF),y
	pha
	txa
	iny
	ora  ($7363& $FF),y
	dey
	tax
	pla
EndCode1026:

; ***** r&I[y] *****

	.byte	$72,$26,$49,$5b,$79,$5d,0
	.byte	EndCode1027-*-1
	and  ($63& $FF),y
	pha
	txa
	iny
	and  ($63& $FF),y
	dey
	tax
	pla
EndCode1027:

; ***** r&L[y] *****

	.byte	$72,$26,$4c,$5b,$79,$5d,0
	.byte	EndCode1028-*-1
	and  ($7363& $FF),y
	pha
	txa
	iny
	and  ($7363& $FF),y
	dey
	tax
	pla
EndCode1028:

; ***** r+I[y] *****

	.byte	$72,$2b,$49,$5b,$79,$5d,0
	.byte	EndCode1029-*-1
	clc
	adc  ($63& $FF),y
	pha
	txa
	iny
	adc  ($63& $FF),y
	dey
	tax
	pla
EndCode1029:

; ***** r+L[y] *****

	.byte	$72,$2b,$4c,$5b,$79,$5d,0
	.byte	EndCode1030-*-1
	clc
	adc  ($7363& $FF),y
	pha
	txa
	iny
	adc  ($7363& $FF),y
	dey
	tax
	pla
EndCode1030:

; ***** repeat *****

	.byte	$72,$65,$70,$65,$61,$74,0
	.byte	EndCode1031-*-1
	.byte	$a3,$06
EndCode1031:

; ***** r.swap *****

	.byte	$72,$2e,$73,$77,$61,$70,0
	.byte	EndCode1032-*-1
	pha
	txa
	plx
EndCode1032:

; ***** r=I[y] *****

	.byte	$72,$3d,$49,$5b,$79,$5d,0
	.byte	EndCode1033-*-1
	iny
	lda  ($63 & $FF),y
	tax
	dey
	lda  ($63 & $FF),y
EndCode1033:

; ***** r=L[y] *****

	.byte	$72,$3d,$4c,$5b,$79,$5d,0
	.byte	EndCode1034-*-1
	iny
	lda  ($7363 & $FF),y
	tax
	dey
	lda  ($7363 & $FF),y
EndCode1034:

; ***** s->cpu *****

	.byte	$73,$2d,$3e,$63,$70,$75,0
	.byte	EndCode1035-*-1
	ply
	plx
	pla
EndCode1035:

; ***** zbyte* *****

	.byte	$7a,$62,$79,$74,$65,$2a,0
	.byte	EndCode1036-*-1
	.byte	$a3,$03
EndCode1036:

; ***** zword* *****

	.byte	$7a,$77,$6f,$72,$64,$2a,0
	.byte	EndCode1037-*-1
	.byte	$a3,$04
EndCode1037:

; ***** a.for *****

	.byte	$61,$2e,$66,$6f,$72,0
	.byte	EndCode1038-*-1
	.byte	$a3,$08
EndCode1038:

; ***** a>=S? *****

	.byte	$61,$3e,$3d,$53,$3f,0
	.byte	EndCode1039-*-1
	cmp  $63
	.byte $93
	bcs *
EndCode1039:

; ***** a>=C? *****

	.byte	$61,$3e,$3d,$43,$3f,0
	.byte	EndCode1040-*-1
	cmp  $7363
	.byte $93
	bcs *
EndCode1040:

; ***** a<>S? *****

	.byte	$61,$3c,$3e,$53,$3f,0
	.byte	EndCode1041-*-1
	cmp  $63
	.byte $93
	bne *
EndCode1041:

; ***** a<>C? *****

	.byte	$61,$3c,$3e,$43,$3f,0
	.byte	EndCode1042-*-1
	cmp  $7363
	.byte $93
	bne *
EndCode1042:

; ***** a>=B? *****

	.byte	$61,$3e,$3d,$42,$3f,0
	.byte	EndCode1043-*-1
	cmp  #$63
	.byte $93
	bcs *
EndCode1043:

; ***** a<>B? *****

	.byte	$61,$3c,$3e,$42,$3f,0
	.byte	EndCode1044-*-1
	cmp  #$63
	.byte $93
	bne *
EndCode1044:

; ***** byte* *****

	.byte	$62,$79,$74,$65,$2a,0
	.byte	EndCode1045-*-1
	.byte	$a3,$01
EndCode1045:

; ***** break *****

	.byte	$62,$72,$65,$61,$6b,0
	.byte	EndCode1046-*-1
	.byte  $DB
EndCode1046:

; ***** endif *****

	.byte	$65,$6e,$64,$69,$66,0
	.byte	EndCode1047-*-1
	.byte	$a3,$0d
EndCode1047:

; ***** proc* *****

	.byte	$70,$72,$6f,$63,$2a,0
	.byte	EndCode1048-*-1
	.byte	$a3,$0e
EndCode1048:

; ***** r.for *****

	.byte	$72,$2e,$66,$6f,$72,0
	.byte	EndCode1049-*-1
	.byte	$a3,$09
EndCode1049:

; ***** r>=W? *****

	.byte	$72,$3e,$3d,$57,$3f,0
	.byte	EndCode1050-*-1
	cmp  #$63
	pha
	txa
	sbc  #$73
	pla
	.byte $93
	bcs *
EndCode1050:

; ***** r<>W? *****

	.byte	$72,$3c,$3e,$57,$3f,0
	.byte	EndCode1051-*-1
	cmp  #$63
	bne  _Skip1
	cpx  #$73
_Skip1:
	.byte $93
	bne *
EndCode1051:

; ***** r>=I? *****

	.byte	$72,$3e,$3d,$49,$3f,0
	.byte	EndCode1052-*-1
	cmp  $63
	pha
	txa
	sbc  $83
	pla
	.byte $93
	bcs *
EndCode1052:

; ***** r>=L? *****

	.byte	$72,$3e,$3d,$4c,$3f,0
	.byte	EndCode1053-*-1
	cmp  $7363
	pha
	txa
	sbc  $7383
	pla
	.byte $93
	bcs *
EndCode1053:

; ***** r<>I? *****

	.byte	$72,$3c,$3e,$49,$3f,0
	.byte	EndCode1054-*-1
	cmp  $63
	bne  _Skip1
	cpx  $83
_Skip1:
	.byte $93
	bne *
EndCode1054:

; ***** r<>L? *****

	.byte	$72,$3c,$3e,$4c,$3f,0
	.byte	EndCode1055-*-1
	cmp  $7363
	bne  _Skip1
	cpx  $7383
_Skip1:
	.byte $93
	bne *
EndCode1055:

; ***** until *****

	.byte	$75,$6e,$74,$69,$6c,0
	.byte	EndCode1056-*-1
	.byte	$a3,$07
EndCode1056:

; ***** word* *****

	.byte	$77,$6f,$72,$64,$2a,0
	.byte	EndCode1057-*-1
	.byte	$a3,$02
EndCode1057:

; ***** a->s *****

	.byte	$61,$2d,$3e,$73,0
	.byte	EndCode1058-*-1
	pha
EndCode1058:

; ***** a<>? *****

	.byte	$61,$3c,$3e,$3f,0
	.byte	EndCode1059-*-1
	cmp #0
	.byte $93
	bne *
EndCode1059:

; ***** a<S? *****

	.byte	$61,$3c,$53,$3f,0
	.byte	EndCode1060-*-1
	cmp  $63
	.byte $93
	bcc *
EndCode1060:

; ***** a<C? *****

	.byte	$61,$3c,$43,$3f,0
	.byte	EndCode1061-*-1
	cmp  $7363
	.byte $93
	bcc *
EndCode1061:

; ***** a=S? *****

	.byte	$61,$3d,$53,$3f,0
	.byte	EndCode1062-*-1
	cmp  $63
	.byte $93
	beq *
EndCode1062:

; ***** a=C? *****

	.byte	$61,$3d,$43,$3f,0
	.byte	EndCode1063-*-1
	cmp  $7363
	.byte $93
	beq *
EndCode1063:

; ***** a<B? *****

	.byte	$61,$3c,$42,$3f,0
	.byte	EndCode1064-*-1
	cmp  #$63
	.byte $93
	bcc *
EndCode1064:

; ***** a=B? *****

	.byte	$61,$3d,$42,$3f,0
	.byte	EndCode1065-*-1
	cmp  #$63
	.byte $93
	beq *
EndCode1065:

; ***** else *****

	.byte	$65,$6c,$73,$65,0
	.byte	EndCode1066-*-1
	.byte	$a3,$0c
EndCode1066:

; ***** next *****

	.byte	$6e,$65,$78,$74,0
	.byte	EndCode1067-*-1
	.byte	$a3,$0a
EndCode1067:

; ***** r->s *****

	.byte	$72,$2d,$3e,$73,0
	.byte	EndCode1068-*-1
	pha
	phx
EndCode1068:

; ***** r<>? *****

	.byte	$72,$3c,$3e,$3f,0
	.byte	EndCode1069-*-1
	cmp #0
	bne *+4
	cpx #0
	.byte $93
	bne *
EndCode1069:

; ***** r<W? *****

	.byte	$72,$3c,$57,$3f,0
	.byte	EndCode1070-*-1
	cmp  #$63
	pha
	txa
	sbc  #$73
	pla
	.byte $93
	bcc *
EndCode1070:

; ***** r=W? *****

	.byte	$72,$3d,$57,$3f,0
	.byte	EndCode1071-*-1
	cmp  #$63
	bne  _Skip1
	cpx  #$73
_Skip1:
	.byte $93
	beq *
EndCode1071:

; ***** r<I? *****

	.byte	$72,$3c,$49,$3f,0
	.byte	EndCode1072-*-1
	cmp  $63
	pha
	txa
	sbc  $83
	pla
	.byte $93
	bcc *
EndCode1072:

; ***** r<L? *****

	.byte	$72,$3c,$4c,$3f,0
	.byte	EndCode1073-*-1
	cmp  $7363
	pha
	txa
	sbc  $7383
	pla
	.byte $93
	bcc *
EndCode1073:

; ***** r=I? *****

	.byte	$72,$3d,$49,$3f,0
	.byte	EndCode1074-*-1
	cmp  $63
	bne  _Skip1
	cpx  $83
_Skip1:
	.byte $93
	beq *
EndCode1074:

; ***** r=L? *****

	.byte	$72,$3d,$4c,$3f,0
	.byte	EndCode1075-*-1
	cmp  $7363
	bne  _Skip1
	cpx  $7383
_Skip1:
	.byte $93
	beq *
EndCode1075:

; ***** s->r *****

	.byte	$73,$2d,$3e,$72,0
	.byte	EndCode1076-*-1
	plx
	pla
EndCode1076:

; ***** s->a *****

	.byte	$73,$2d,$3e,$61,0
	.byte	EndCode1077-*-1
	pla
EndCode1077:

; ***** s->y *****

	.byte	$73,$2d,$3e,$79,0
	.byte	EndCode1078-*-1
	ply
EndCode1078:

; ***** y->s *****

	.byte	$79,$2d,$3e,$73,0
	.byte	EndCode1079-*-1
	phy
EndCode1079:

; ***** ++S *****

	.byte	$2b,$2b,$53,0
	.byte	EndCode1080-*-1
	inc  $63
EndCode1080:

; ***** ++C *****

	.byte	$2b,$2b,$43,0
	.byte	EndCode1081-*-1
	inc  $7363
EndCode1081:

; ***** ++I *****

	.byte	$2b,$2b,$49,0
	.byte	EndCode1082-*-1
	inc  $63
	bne  _NoCarry
	inc  $83
_NoCarry:
EndCode1082:

; ***** ++L *****

	.byte	$2b,$2b,$4c,0
	.byte	EndCode1083-*-1
	inc  $7363
	bne  _NoCarry
	inc  $7383
_NoCarry:
EndCode1083:

; ***** ++r *****

	.byte	$2b,$2b,$72,0
	.byte	EndCode1084-*-1
	inc  a
	bne  *+3
	inx
EndCode1084:

; ***** ++a *****

	.byte	$2b,$2b,$61,0
	.byte	EndCode1085-*-1
	inc  a
EndCode1085:

; ***** ++y *****

	.byte	$2b,$2b,$79,0
	.byte	EndCode1086-*-1
	iny
EndCode1086:

; ***** --S *****

	.byte	$2d,$2d,$53,0
	.byte	EndCode1087-*-1
	dec  $63
EndCode1087:

; ***** --C *****

	.byte	$2d,$2d,$43,0
	.byte	EndCode1088-*-1
	dec  $7363
EndCode1088:

; ***** --I *****

	.byte	$2d,$2d,$49,0
	.byte	EndCode1089-*-1
	pha
	lda  $63
	bne  _NoBorrow
	dec  $83
_NoBorrow:
	dec  $63
	pla
EndCode1089:

; ***** --L *****

	.byte	$2d,$2d,$4c,0
	.byte	EndCode1090-*-1
	pha
	lda  $7363
	bne  _NoBorrow
	dec  $7383
_NoBorrow:
	dec  $7363
	pla
EndCode1090:

; ***** --r *****

	.byte	$2d,$2d,$72,0
	.byte	EndCode1091-*-1
	cmp  #0
	bne  *+3
	dex
	dec  a
EndCode1091:

; ***** --a *****

	.byte	$2d,$2d,$61,0
	.byte	EndCode1092-*-1
	dec  a
EndCode1092:

; ***** --y *****

	.byte	$2d,$2d,$79,0
	.byte	EndCode1093-*-1
	dey
EndCode1093:

; ***** <<S *****

	.byte	$3c,$3c,$53,0
	.byte	EndCode1094-*-1
	asl  $63
EndCode1094:

; ***** <<C *****

	.byte	$3c,$3c,$43,0
	.byte	EndCode1095-*-1
	asl  $7363
EndCode1095:

; ***** <<I *****

	.byte	$3c,$3c,$49,0
	.byte	EndCode1096-*-1
	asl  $63
	rol  $83
EndCode1096:

; ***** <<L *****

	.byte	$3c,$3c,$4c,0
	.byte	EndCode1097-*-1
	asl  $7363
	rol  $7383
EndCode1097:

; ***** <<r *****

	.byte	$3c,$3c,$72,0
	.byte	EndCode1098-*-1
	asl  a
	pha
	txa
	rol  a
	tax
	pla
EndCode1098:

; ***** <<a *****

	.byte	$3c,$3c,$61,0
	.byte	EndCode1099-*-1
	asl  a
EndCode1099:

; ***** >>S *****

	.byte	$3e,$3e,$53,0
	.byte	EndCode1100-*-1
	lsr  $63
EndCode1100:

; ***** >>C *****

	.byte	$3e,$3e,$43,0
	.byte	EndCode1101-*-1
	lsr  $7363
EndCode1101:

; ***** >>I *****

	.byte	$3e,$3e,$49,0
	.byte	EndCode1102-*-1
	lsr  $83
	ror  $63
EndCode1102:

; ***** >>L *****

	.byte	$3e,$3e,$4c,0
	.byte	EndCode1103-*-1
	lsr  $7383
	ror  $7363
EndCode1103:

; ***** >>r *****

	.byte	$3e,$3e,$72,0
	.byte	EndCode1104-*-1
	pha
	txa
	lsr  a
	tax
	pla
	ror  a
EndCode1104:

; ***** >>a *****

	.byte	$3e,$3e,$61,0
	.byte	EndCode1105-*-1
	lsr  a
EndCode1105:

; ***** C=r *****

	.byte	$43,$3d,$72,0
	.byte	EndCode1106-*-1
	sta  $7363
EndCode1106:

; ***** C=a *****

	.byte	$43,$3d,$61,0
	.byte	EndCode1107-*-1
	sta  $7363
EndCode1107:

; ***** C=y *****

	.byte	$43,$3d,$79,0
	.byte	EndCode1108-*-1
	sty  $7363
EndCode1108:

; ***** I=r *****

	.byte	$49,$3d,$72,0
	.byte	EndCode1109-*-1
	sta  $63
	stx  $83
EndCode1109:

; ***** L=r *****

	.byte	$4c,$3d,$72,0
	.byte	EndCode1110-*-1
	sta  $7363
	stx  $7383
EndCode1110:

; ***** P(* *****

	.byte	$50,$28,$2a,0
	.byte	EndCode1111-*-1
	.byte	$a3,$0f
EndCode1111:

; ***** S=r *****

	.byte	$53,$3d,$72,0
	.byte	EndCode1112-*-1
	sta  $63
EndCode1112:

; ***** S=a *****

	.byte	$53,$3d,$61,0
	.byte	EndCode1113-*-1
	sta  $63
EndCode1113:

; ***** S=y *****

	.byte	$53,$3d,$79,0
	.byte	EndCode1114-*-1
	sty  $63
EndCode1114:

; ***** a^B *****

	.byte	$61,$5e,$42,0
	.byte	EndCode1115-*-1
	eor  #$63
EndCode1115:

; ***** a^S *****

	.byte	$61,$5e,$53,0
	.byte	EndCode1116-*-1
	eor  $63
EndCode1116:

; ***** a^C *****

	.byte	$61,$5e,$43,0
	.byte	EndCode1117-*-1
	eor  $7363
EndCode1117:

; ***** a-B *****

	.byte	$61,$2d,$42,0
	.byte	EndCode1118-*-1
	sec
	sbc  #$63
EndCode1118:

; ***** a-S *****

	.byte	$61,$2d,$53,0
	.byte	EndCode1119-*-1
	sec
	sbc  $63
EndCode1119:

; ***** a-C *****

	.byte	$61,$2d,$43,0
	.byte	EndCode1120-*-1
	sec
	sbc  $7363
EndCode1120:

; ***** a|B *****

	.byte	$61,$7c,$42,0
	.byte	EndCode1121-*-1
	ora  #$63
EndCode1121:

; ***** a|S *****

	.byte	$61,$7c,$53,0
	.byte	EndCode1122-*-1
	ora  $63
EndCode1122:

; ***** a|C *****

	.byte	$61,$7c,$43,0
	.byte	EndCode1123-*-1
	ora  $7363
EndCode1123:

; ***** a&B *****

	.byte	$61,$26,$42,0
	.byte	EndCode1124-*-1
	and  #$63
EndCode1124:

; ***** a&S *****

	.byte	$61,$26,$53,0
	.byte	EndCode1125-*-1
	and  $63
EndCode1125:

; ***** a&C *****

	.byte	$61,$26,$43,0
	.byte	EndCode1126-*-1
	and  $7363
EndCode1126:

; ***** a+B *****

	.byte	$61,$2b,$42,0
	.byte	EndCode1127-*-1
	clc
	adc  #$63
EndCode1127:

; ***** a+S *****

	.byte	$61,$2b,$53,0
	.byte	EndCode1128-*-1
	clc
	adc  $63
EndCode1128:

; ***** a+C *****

	.byte	$61,$2b,$43,0
	.byte	EndCode1129-*-1
	clc
	adc  $7363
EndCode1129:

; ***** a=? *****

	.byte	$61,$3d,$3f,0
	.byte	EndCode1130-*-1
	cmp #0
	.byte $93
	beq *
EndCode1130:

; ***** a+? *****

	.byte	$61,$2b,$3f,0
	.byte	EndCode1131-*-1
	cmp #0
	.byte $93
	bpl *
EndCode1131:

; ***** a-? *****

	.byte	$61,$2d,$3f,0
	.byte	EndCode1132-*-1
	cmp #0
	.byte $93
	bmi *
EndCode1132:

; ***** a=y *****

	.byte	$61,$3d,$79,0
	.byte	EndCode1133-*-1
	tya
EndCode1133:

; ***** a=r *****

	.byte	$61,$3d,$72,0
	.byte	EndCode1134-*-1
EndCode1134:

; ***** a=B *****

	.byte	$61,$3d,$42,0
	.byte	EndCode1135-*-1
	lda  #$63
EndCode1135:

; ***** a=S *****

	.byte	$61,$3d,$53,0
	.byte	EndCode1136-*-1
	lda  $63
EndCode1136:

; ***** a=C *****

	.byte	$61,$3d,$43,0
	.byte	EndCode1137-*-1
	lda  $7363
EndCode1137:

; ***** cs? *****

	.byte	$63,$73,$3f,0
	.byte	EndCode1138-*-1
	.byte $93
	bcs  *
EndCode1138:

; ***** cc? *****

	.byte	$63,$63,$3f,0
	.byte	EndCode1139-*-1
	.byte $93
	bcc  *
EndCode1139:

; ***** r^B *****

	.byte	$72,$5e,$42,0
	.byte	EndCode1140-*-1
	eor  #$63
EndCode1140:

; ***** r^W *****

	.byte	$72,$5e,$57,0
	.byte	EndCode1141-*-1
	eor  #$63
	pha
	txa
	eor  #$73
	tax
	pla
EndCode1141:

; ***** r^I *****

	.byte	$72,$5e,$49,0
	.byte	EndCode1142-*-1
	eor  $63
	pha
	txa
	eor  $83
	tax
	pla
EndCode1142:

; ***** r^L *****

	.byte	$72,$5e,$4c,0
	.byte	EndCode1143-*-1
	eor  $7363
	pha
	txa
	eor  $7383
	tax
	pla
EndCode1143:

; ***** r^S *****

	.byte	$72,$5e,$53,0
	.byte	EndCode1144-*-1
	eor  $63
EndCode1144:

; ***** r^C *****

	.byte	$72,$5e,$43,0
	.byte	EndCode1145-*-1
	eor  $7363
EndCode1145:

; ***** r-B *****

	.byte	$72,$2d,$42,0
	.byte	EndCode1146-*-1
	sec
	sbc  #$63
	bcs  *+3
	dex
EndCode1146:

; ***** r-W *****

	.byte	$72,$2d,$57,0
	.byte	EndCode1147-*-1
	sec
	sbc  #$63
	pha
	txa
	sbc  #$73
	tax
	pla
EndCode1147:

; ***** r-I *****

	.byte	$72,$2d,$49,0
	.byte	EndCode1148-*-1
	sec
	sbc  $63
	pha
	txa
	sbc  $83
	tax
	pla
EndCode1148:

; ***** r-L *****

	.byte	$72,$2d,$4c,0
	.byte	EndCode1149-*-1
	sec
	sbc  $7363
	pha
	txa
	sbc  $7383
	tax
	pla
EndCode1149:

; ***** r-S *****

	.byte	$72,$2d,$53,0
	.byte	EndCode1150-*-1
	sec
	sbc  $63
	bcs  *+3
	dex
EndCode1150:

; ***** r-C *****

	.byte	$72,$2d,$43,0
	.byte	EndCode1151-*-1
	sec
	sbc  $7363
	bcs  *+3
	dex
EndCode1151:

; ***** r|B *****

	.byte	$72,$7c,$42,0
	.byte	EndCode1152-*-1
	ora  #$63
EndCode1152:

; ***** r|W *****

	.byte	$72,$7c,$57,0
	.byte	EndCode1153-*-1
	ora  #$63
	pha
	txa
	ora  #$73
	tax
	pla
EndCode1153:

; ***** r|I *****

	.byte	$72,$7c,$49,0
	.byte	EndCode1154-*-1
	ora  $63
	pha
	txa
	ora  $83
	tax
	pla
EndCode1154:

; ***** r|L *****

	.byte	$72,$7c,$4c,0
	.byte	EndCode1155-*-1
	ora  $7363
	pha
	txa
	ora  $7383
	tax
	pla
EndCode1155:

; ***** r|S *****

	.byte	$72,$7c,$53,0
	.byte	EndCode1156-*-1
	ora  $63
EndCode1156:

; ***** r|C *****

	.byte	$72,$7c,$43,0
	.byte	EndCode1157-*-1
	ora  $7363
EndCode1157:

; ***** r&B *****

	.byte	$72,$26,$42,0
	.byte	EndCode1158-*-1
	and  #$63
	ldx  #0
EndCode1158:

; ***** r&W *****

	.byte	$72,$26,$57,0
	.byte	EndCode1159-*-1
	and  #$63
	pha
	txa
	and  #$73
	tax
	pla
EndCode1159:

; ***** r&I *****

	.byte	$72,$26,$49,0
	.byte	EndCode1160-*-1
	and  $63
	pha
	txa
	and  $83
	tax
	pla
EndCode1160:

; ***** r&L *****

	.byte	$72,$26,$4c,0
	.byte	EndCode1161-*-1
	and  $7363
	pha
	txa
	and  $7383
	tax
	pla
EndCode1161:

; ***** r&S *****

	.byte	$72,$26,$53,0
	.byte	EndCode1162-*-1
	and  $63
	ldx  #0
EndCode1162:

; ***** r&C *****

	.byte	$72,$26,$43,0
	.byte	EndCode1163-*-1
	and  $7363
	ldx  #0
EndCode1163:

; ***** r+B *****

	.byte	$72,$2b,$42,0
	.byte	EndCode1164-*-1
	clc
	adc  #$63
	bcc  *+3
	inx
EndCode1164:

; ***** r+W *****

	.byte	$72,$2b,$57,0
	.byte	EndCode1165-*-1
	clc
	adc  #$63
	pha
	txa
	adc  #$73
	tax
	pla
EndCode1165:

; ***** r+I *****

	.byte	$72,$2b,$49,0
	.byte	EndCode1166-*-1
	clc
	adc  $63
	pha
	txa
	adc  $83
	tax
	pla
EndCode1166:

; ***** r+L *****

	.byte	$72,$2b,$4c,0
	.byte	EndCode1167-*-1
	clc
	adc  $7363
	pha
	txa
	adc  $7383
	tax
	pla
EndCode1167:

; ***** r+S *****

	.byte	$72,$2b,$53,0
	.byte	EndCode1168-*-1
	clc
	adc  $63
	bcc  *+3
	inx
EndCode1168:

; ***** r+C *****

	.byte	$72,$2b,$43,0
	.byte	EndCode1169-*-1
	clc
	adc  $7363
	bcc  *+3
	inx
EndCode1169:

; ***** r=? *****

	.byte	$72,$3d,$3f,0
	.byte	EndCode1170-*-1
	cmp #0
	bne *+4
	cpx #0
	.byte $93
	beq *
EndCode1170:

; ***** r+? *****

	.byte	$72,$2b,$3f,0
	.byte	EndCode1171-*-1
	cpx #0
	.byte $93
	bpl *
EndCode1171:

; ***** r-? *****

	.byte	$72,$2d,$3f,0
	.byte	EndCode1172-*-1
	cpx #0
	.byte $93
	bmi *
EndCode1172:

; ***** r=a *****

	.byte	$72,$3d,$61,0
	.byte	EndCode1173-*-1
	ldx  #0
EndCode1173:

; ***** r=y *****

	.byte	$72,$3d,$79,0
	.byte	EndCode1174-*-1
	tya
	ldx  #0
EndCode1174:

; ***** r=B *****

	.byte	$72,$3d,$42,0
	.byte	EndCode1175-*-1
	lda  #$63
	ldx  #$73
EndCode1175:

; ***** r=W *****

	.byte	$72,$3d,$57,0
	.byte	EndCode1176-*-1
	lda  #$63
	ldx  #$73
EndCode1176:

; ***** r=I *****

	.byte	$72,$3d,$49,0
	.byte	EndCode1177-*-1
	lda  $63
	ldx  $83
EndCode1177:

; ***** r=L *****

	.byte	$72,$3d,$4c,0
	.byte	EndCode1178-*-1
	lda  $7363
	ldx  $7383
EndCode1178:

; ***** r=S *****

	.byte	$72,$3d,$53,0
	.byte	EndCode1179-*-1
	lda  $63
	ldx  #0
EndCode1179:

; ***** r=C *****

	.byte	$72,$3d,$43,0
	.byte	EndCode1180-*-1
	lda  $7363
	ldx  #0
EndCode1180:

; ***** y=a *****

	.byte	$79,$3d,$61,0
	.byte	EndCode1181-*-1
	tay
EndCode1181:

; ***** y=r *****

	.byte	$79,$3d,$72,0
	.byte	EndCode1182-*-1
	tay
EndCode1182:

; ***** y=B *****

	.byte	$79,$3d,$42,0
	.byte	EndCode1183-*-1
	ldy  #$63
EndCode1183:

; ***** y=S *****

	.byte	$79,$3d,$53,0
	.byte	EndCode1184-*-1
	ldy  $63
EndCode1184:

; ***** y=C *****

	.byte	$79,$3d,$43,0
	.byte	EndCode1185-*-1
	ldy  $7363
EndCode1185:

; ***** -a *****

	.byte	$2d,$61,0
	.byte	EndCode1186-*-1
	eor  #$FF
	inc  a
EndCode1186:

; ***** -r *****

	.byte	$2d,$72,0
	.byte	EndCode1187-*-1
	pha
	txa
	eor  #$FF
	tax
	pla
	eor  #$FF
	inc  a
	bne  *+3
	inx
EndCode1187:

; ***** ^a *****

	.byte	$5e,$61,0
	.byte	EndCode1188-*-1
	eor  #$FF
EndCode1188:

; ***** ^r *****

	.byte	$5e,$72,0
	.byte	EndCode1189-*-1
	pha
	txa
	eor  #$FF
	tax
	pla
	eor  #$FF
EndCode1189:

; ***** if *****

	.byte	$69,$66,0
	.byte	EndCode1190-*-1
	.byte	$a3,$0b
EndCode1190:

; ***** B *****

	.byte	$42,0
	.byte	EndCode1191-*-1
	lda  #$63
	ldx  #$73
EndCode1191:

; ***** C *****

	.byte	$43,0
	.byte	EndCode1192-*-1
	lda  $7363
	ldx  #0
EndCode1192:

; ***** I *****

	.byte	$49,0
	.byte	EndCode1193-*-1
	lda  $63
	ldx  $83
EndCode1193:

; ***** L *****

	.byte	$4c,0
	.byte	EndCode1194-*-1
	lda  $7363
	ldx  $7383
EndCode1194:

; ***** S *****

	.byte	$53,0
	.byte	EndCode1195-*-1
	lda  $63
	ldx  #0
EndCode1195:

; ***** W *****

	.byte	$57,0
	.byte	EndCode1196-*-1
	lda  #$63
	ldx  #$73
EndCode1196:
	.byte	0
