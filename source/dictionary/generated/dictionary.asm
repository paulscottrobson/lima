;
;	This code is automatically generated.
;
	* = $1000

; ***** remove.locals *****

	.byte	$72,$65,$6d,$6f,$76,$65,$2e,$6c,$6f,$63,$61,$6c,$73,0
	.byte	EndCode1000-*-1
	.byte	$a3,$03
EndCode1000:

; ***** endproc *****

	.byte	$65,$6e,$64,$70,$72,$6f,$63,0
	.byte	EndCode1001-*-1
	.byte	$a3,$0e
EndCode1001:

; ***** I[y]=a *****

	.byte	$49,$5b,$79,$5d,$3d,$61,0
	.byte	EndCode1002-*-1
	sta  ($63 & $FF),y
EndCode1002:

; ***** I[y]=r *****

	.byte	$49,$5b,$79,$5d,$3d,$72,0
	.byte	EndCode1003-*-1
	sta  ($63 & $FF),y
	iny
	txa
	sta  ($63 & $FF),y
	dey
	lda  ($63 & $FF),y
EndCode1003:

; ***** L[y]=a *****

	.byte	$4c,$5b,$79,$5d,$3d,$61,0
	.byte	EndCode1004-*-1
	sta  ($7363 & $FF),y
EndCode1004:

; ***** L[y]=r *****

	.byte	$4c,$5b,$79,$5d,$3d,$72,0
	.byte	EndCode1005-*-1
	sta  ($7363 & $FF),y
	iny
	txa
	sta  ($7363 & $FF),y
	dey
	lda  ($7363 & $FF),y
EndCode1005:

; ***** a^I[y] *****

	.byte	$61,$5e,$49,$5b,$79,$5d,0
	.byte	EndCode1006-*-1
	eor  ($63 & $FF),y
EndCode1006:

; ***** a^L[y] *****

	.byte	$61,$5e,$4c,$5b,$79,$5d,0
	.byte	EndCode1007-*-1
	eor  ($7363 & $FF),y
EndCode1007:

; ***** a-I[y] *****

	.byte	$61,$2d,$49,$5b,$79,$5d,0
	.byte	EndCode1008-*-1
	sec
	sbc  ($63& $FF),y
EndCode1008:

; ***** a-L[y] *****

	.byte	$61,$2d,$4c,$5b,$79,$5d,0
	.byte	EndCode1009-*-1
	sec
	sbc  ($7363& $FF),y
EndCode1009:

; ***** a|I[y] *****

	.byte	$61,$7c,$49,$5b,$79,$5d,0
	.byte	EndCode1010-*-1
	ora  ($63& $FF),y
EndCode1010:

; ***** a|L[y] *****

	.byte	$61,$7c,$4c,$5b,$79,$5d,0
	.byte	EndCode1011-*-1
	ora  ($7363& $FF),y
EndCode1011:

; ***** a&I[y] *****

	.byte	$61,$26,$49,$5b,$79,$5d,0
	.byte	EndCode1012-*-1
	and  ($63& $FF),y
EndCode1012:

; ***** a&L[y] *****

	.byte	$61,$26,$4c,$5b,$79,$5d,0
	.byte	EndCode1013-*-1
	and  ($7363& $FF),y
EndCode1013:

; ***** a+I[y] *****

	.byte	$61,$2b,$49,$5b,$79,$5d,0
	.byte	EndCode1014-*-1
	clc
	adc  ($63& $FF),y
EndCode1014:

; ***** a+L[y] *****

	.byte	$61,$2b,$4c,$5b,$79,$5d,0
	.byte	EndCode1015-*-1
	clc
	adc  ($7363& $FF),y
EndCode1015:

; ***** a=I[y] *****

	.byte	$61,$3d,$49,$5b,$79,$5d,0
	.byte	EndCode1016-*-1
	lda  ($63 & $FF),y
EndCode1016:

; ***** a=L[y] *****

	.byte	$61,$3d,$4c,$5b,$79,$5d,0
	.byte	EndCode1017-*-1
	lda  ($7363 & $FF),y
EndCode1017:

; ***** r^I[y] *****

	.byte	$72,$5e,$49,$5b,$79,$5d,0
	.byte	EndCode1018-*-1
	eor  ($63 & $FF),y
	pha
	txa
	iny
	eor  ($63 & $FF),y
	dey
	tax
	pla
EndCode1018:

; ***** r^L[y] *****

	.byte	$72,$5e,$4c,$5b,$79,$5d,0
	.byte	EndCode1019-*-1
	eor  ($7363 & $FF),y
	pha
	txa
	iny
	eor  ($7363 & $FF),y
	dey
	tax
	pla
EndCode1019:

; ***** r-I[y] *****

	.byte	$72,$2d,$49,$5b,$79,$5d,0
	.byte	EndCode1020-*-1
	sec
	sbc  ($63& $FF),y
	pha
	txa
	iny
	sbc  ($63& $FF),y
	dey
	tax
	pla
EndCode1020:

; ***** r-L[y] *****

	.byte	$72,$2d,$4c,$5b,$79,$5d,0
	.byte	EndCode1021-*-1
	sec
	sbc  ($7363& $FF),y
	pha
	txa
	iny
	sbc  ($7363& $FF),y
	dey
	tax
	pla
EndCode1021:

; ***** r|I[y] *****

	.byte	$72,$7c,$49,$5b,$79,$5d,0
	.byte	EndCode1022-*-1
	ora  ($63& $FF),y
	pha
	txa
	iny
	ora  ($63& $FF),y
	dey
	tax
	pla
EndCode1022:

; ***** r|L[y] *****

	.byte	$72,$7c,$4c,$5b,$79,$5d,0
	.byte	EndCode1023-*-1
	ora  ($7363& $FF),y
	pha
	txa
	iny
	ora  ($7363& $FF),y
	dey
	tax
	pla
EndCode1023:

; ***** r&I[y] *****

	.byte	$72,$26,$49,$5b,$79,$5d,0
	.byte	EndCode1024-*-1
	and  ($63& $FF),y
	pha
	txa
	iny
	and  ($63& $FF),y
	dey
	tax
	pla
EndCode1024:

; ***** r&L[y] *****

	.byte	$72,$26,$4c,$5b,$79,$5d,0
	.byte	EndCode1025-*-1
	and  ($7363& $FF),y
	pha
	txa
	iny
	and  ($7363& $FF),y
	dey
	tax
	pla
EndCode1025:

; ***** r+I[y] *****

	.byte	$72,$2b,$49,$5b,$79,$5d,0
	.byte	EndCode1026-*-1
	clc
	adc  ($63& $FF),y
	pha
	txa
	iny
	adc  ($63& $FF),y
	dey
	tax
	pla
EndCode1026:

; ***** r+L[y] *****

	.byte	$72,$2b,$4c,$5b,$79,$5d,0
	.byte	EndCode1027-*-1
	clc
	adc  ($7363& $FF),y
	pha
	txa
	iny
	adc  ($7363& $FF),y
	dey
	tax
	pla
EndCode1027:

; ***** ray->s *****

	.byte	$72,$61,$79,$2d,$3e,$73,0
	.byte	EndCode1028-*-1
	pha
	phx
	phy
EndCode1028:

; ***** repeat *****

	.byte	$72,$65,$70,$65,$61,$74,0
	.byte	EndCode1029-*-1
	.byte	$a3,$04
EndCode1029:

; ***** r.swap *****

	.byte	$72,$2e,$73,$77,$61,$70,0
	.byte	EndCode1030-*-1
	pha
	txa
	plx
EndCode1030:

; ***** r=I[y] *****

	.byte	$72,$3d,$49,$5b,$79,$5d,0
	.byte	EndCode1031-*-1
	iny
	lda  ($63 & $FF),y
	tax
	dey
	lda  ($63 & $FF),y
EndCode1031:

; ***** r=L[y] *****

	.byte	$72,$3d,$4c,$5b,$79,$5d,0
	.byte	EndCode1032-*-1
	iny
	lda  ($7363 & $FF),y
	tax
	dey
	lda  ($7363 & $FF),y
EndCode1032:

; ***** s->ray *****

	.byte	$73,$2d,$3e,$72,$61,$79,0
	.byte	EndCode1033-*-1
	ply
	plx
	pla
EndCode1033:

; ***** a.for *****

	.byte	$61,$2e,$66,$6f,$72,0
	.byte	EndCode1034-*-1
	.byte	$a3,$06
EndCode1034:

; ***** a>=S? *****

	.byte	$61,$3e,$3d,$53,$3f,0
	.byte	EndCode1035-*-1
	cmp  $63
	.byte $93
	bcs *
EndCode1035:

; ***** a>=C? *****

	.byte	$61,$3e,$3d,$43,$3f,0
	.byte	EndCode1036-*-1
	cmp  $7363
	.byte $93
	bcs *
EndCode1036:

; ***** a<>S? *****

	.byte	$61,$3c,$3e,$53,$3f,0
	.byte	EndCode1037-*-1
	cmp  $63
	.byte $93
	bne *
EndCode1037:

; ***** a<>C? *****

	.byte	$61,$3c,$3e,$43,$3f,0
	.byte	EndCode1038-*-1
	cmp  $7363
	.byte $93
	bne *
EndCode1038:

; ***** a>=B? *****

	.byte	$61,$3e,$3d,$42,$3f,0
	.byte	EndCode1039-*-1
	cmp  #$63
	.byte $93
	bcs *
EndCode1039:

; ***** a<>B? *****

	.byte	$61,$3c,$3e,$42,$3f,0
	.byte	EndCode1040-*-1
	cmp  #$63
	.byte $93
	bne *
EndCode1040:

; ***** byte* *****

	.byte	$62,$79,$74,$65,$2a,0
	.byte	EndCode1041-*-1
	.byte	$a3,$01
EndCode1041:

; ***** break *****

	.byte	$62,$72,$65,$61,$6b,0
	.byte	EndCode1042-*-1
	.byte  $DB
EndCode1042:

; ***** endif *****

	.byte	$65,$6e,$64,$69,$66,0
	.byte	EndCode1043-*-1
	.byte	$a3,$0b
EndCode1043:

; ***** proc* *****

	.byte	$70,$72,$6f,$63,$2a,0
	.byte	EndCode1044-*-1
	.byte	$a3,$0c
EndCode1044:

; ***** r.for *****

	.byte	$72,$2e,$66,$6f,$72,0
	.byte	EndCode1045-*-1
	.byte	$a3,$07
EndCode1045:

; ***** r>=W? *****

	.byte	$72,$3e,$3d,$57,$3f,0
	.byte	EndCode1046-*-1
	cmp  #$63
	pha
	txa
	sbc  #$73
	pla
	.byte $93
	bcs *
EndCode1046:

; ***** r<>W? *****

	.byte	$72,$3c,$3e,$57,$3f,0
	.byte	EndCode1047-*-1
	cmp  #$63
	bne  _Skip1
	cpx  #$73
_Skip1:
	.byte $93
	bne *
EndCode1047:

; ***** r>=I? *****

	.byte	$72,$3e,$3d,$49,$3f,0
	.byte	EndCode1048-*-1
	cmp  $63
	pha
	txa
	sbc  $83
	pla
	.byte $93
	bcs *
EndCode1048:

; ***** r>=L? *****

	.byte	$72,$3e,$3d,$4c,$3f,0
	.byte	EndCode1049-*-1
	cmp  $7363
	pha
	txa
	sbc  $7383
	pla
	.byte $93
	bcs *
EndCode1049:

; ***** r<>I? *****

	.byte	$72,$3c,$3e,$49,$3f,0
	.byte	EndCode1050-*-1
	cmp  $63
	bne  _Skip1
	cpx  $83
_Skip1:
	.byte $93
	bne *
EndCode1050:

; ***** r<>L? *****

	.byte	$72,$3c,$3e,$4c,$3f,0
	.byte	EndCode1051-*-1
	cmp  $7363
	bne  _Skip1
	cpx  $7383
_Skip1:
	.byte $93
	bne *
EndCode1051:

; ***** until *****

	.byte	$75,$6e,$74,$69,$6c,0
	.byte	EndCode1052-*-1
	.byte	$a3,$05
EndCode1052:

; ***** word* *****

	.byte	$77,$6f,$72,$64,$2a,0
	.byte	EndCode1053-*-1
	.byte	$a3,$02
EndCode1053:

; ***** a->s *****

	.byte	$61,$2d,$3e,$73,0
	.byte	EndCode1054-*-1
	pha
EndCode1054:

; ***** a<>? *****

	.byte	$61,$3c,$3e,$3f,0
	.byte	EndCode1055-*-1
	cmp #0
	.byte $93
	bne *
EndCode1055:

; ***** a<S? *****

	.byte	$61,$3c,$53,$3f,0
	.byte	EndCode1056-*-1
	cmp  $63
	.byte $93
	bcc *
EndCode1056:

; ***** a<C? *****

	.byte	$61,$3c,$43,$3f,0
	.byte	EndCode1057-*-1
	cmp  $7363
	.byte $93
	bcc *
EndCode1057:

; ***** a=S? *****

	.byte	$61,$3d,$53,$3f,0
	.byte	EndCode1058-*-1
	cmp  $63
	.byte $93
	beq *
EndCode1058:

; ***** a=C? *****

	.byte	$61,$3d,$43,$3f,0
	.byte	EndCode1059-*-1
	cmp  $7363
	.byte $93
	beq *
EndCode1059:

; ***** a<B? *****

	.byte	$61,$3c,$42,$3f,0
	.byte	EndCode1060-*-1
	cmp  #$63
	.byte $93
	bcc *
EndCode1060:

; ***** a=B? *****

	.byte	$61,$3d,$42,$3f,0
	.byte	EndCode1061-*-1
	cmp  #$63
	.byte $93
	beq *
EndCode1061:

; ***** else *****

	.byte	$65,$6c,$73,$65,0
	.byte	EndCode1062-*-1
	.byte	$a3,$0a
EndCode1062:

; ***** next *****

	.byte	$6e,$65,$78,$74,0
	.byte	EndCode1063-*-1
	.byte	$a3,$08
EndCode1063:

; ***** r->s *****

	.byte	$72,$2d,$3e,$73,0
	.byte	EndCode1064-*-1
	pha
	phx
EndCode1064:

; ***** r<>? *****

	.byte	$72,$3c,$3e,$3f,0
	.byte	EndCode1065-*-1
	cmp #0
	bne *+4
	cpx #0
	.byte $93
	bne *
EndCode1065:

; ***** r<W? *****

	.byte	$72,$3c,$57,$3f,0
	.byte	EndCode1066-*-1
	cmp  #$63
	pha
	txa
	sbc  #$73
	pla
	.byte $93
	bcc *
EndCode1066:

; ***** r=W? *****

	.byte	$72,$3d,$57,$3f,0
	.byte	EndCode1067-*-1
	cmp  #$63
	bne  _Skip1
	cpx  #$73
_Skip1:
	.byte $93
	beq *
EndCode1067:

; ***** r<I? *****

	.byte	$72,$3c,$49,$3f,0
	.byte	EndCode1068-*-1
	cmp  $63
	pha
	txa
	sbc  $83
	pla
	.byte $93
	bcc *
EndCode1068:

; ***** r<L? *****

	.byte	$72,$3c,$4c,$3f,0
	.byte	EndCode1069-*-1
	cmp  $7363
	pha
	txa
	sbc  $7383
	pla
	.byte $93
	bcc *
EndCode1069:

; ***** r=I? *****

	.byte	$72,$3d,$49,$3f,0
	.byte	EndCode1070-*-1
	cmp  $63
	bne  _Skip1
	cpx  $83
_Skip1:
	.byte $93
	beq *
EndCode1070:

; ***** r=L? *****

	.byte	$72,$3d,$4c,$3f,0
	.byte	EndCode1071-*-1
	cmp  $7363
	bne  _Skip1
	cpx  $7383
_Skip1:
	.byte $93
	beq *
EndCode1071:

; ***** s->r *****

	.byte	$73,$2d,$3e,$72,0
	.byte	EndCode1072-*-1
	plx
	pla
EndCode1072:

; ***** s->a *****

	.byte	$73,$2d,$3e,$61,0
	.byte	EndCode1073-*-1
	pla
EndCode1073:

; ***** s->y *****

	.byte	$73,$2d,$3e,$79,0
	.byte	EndCode1074-*-1
	ply
EndCode1074:

; ***** y->s *****

	.byte	$79,$2d,$3e,$73,0
	.byte	EndCode1075-*-1
	phy
EndCode1075:

; ***** ++S *****

	.byte	$2b,$2b,$53,0
	.byte	EndCode1076-*-1
	inc  $63
EndCode1076:

; ***** ++C *****

	.byte	$2b,$2b,$43,0
	.byte	EndCode1077-*-1
	inc  $7363
EndCode1077:

; ***** ++I *****

	.byte	$2b,$2b,$49,0
	.byte	EndCode1078-*-1
	inc  $63
	bne  _NoCarry
	inc  $83
_NoCarry:
EndCode1078:

; ***** ++L *****

	.byte	$2b,$2b,$4c,0
	.byte	EndCode1079-*-1
	inc  $7363
	bne  _NoCarry
	inc  $7383
_NoCarry:
EndCode1079:

; ***** ++r *****

	.byte	$2b,$2b,$72,0
	.byte	EndCode1080-*-1
	inc  a
	bne  *+3
	inx
EndCode1080:

; ***** ++a *****

	.byte	$2b,$2b,$61,0
	.byte	EndCode1081-*-1
	inc  a
EndCode1081:

; ***** ++y *****

	.byte	$2b,$2b,$79,0
	.byte	EndCode1082-*-1
	iny
EndCode1082:

; ***** --S *****

	.byte	$2d,$2d,$53,0
	.byte	EndCode1083-*-1
	dec  $63
EndCode1083:

; ***** --C *****

	.byte	$2d,$2d,$43,0
	.byte	EndCode1084-*-1
	dec  $7363
EndCode1084:

; ***** --I *****

	.byte	$2d,$2d,$49,0
	.byte	EndCode1085-*-1
	pha
	lda  $63
	bne  _NoBorrow
	dec  $83
_NoBorrow:
	dec  $63
	pla
EndCode1085:

; ***** --L *****

	.byte	$2d,$2d,$4c,0
	.byte	EndCode1086-*-1
	pha
	lda  $7363
	bne  _NoBorrow
	dec  $7383
_NoBorrow:
	dec  $7363
	pla
EndCode1086:

; ***** --r *****

	.byte	$2d,$2d,$72,0
	.byte	EndCode1087-*-1
	cmp  #0
	bne  *+3
	dex
	dec  a
EndCode1087:

; ***** --a *****

	.byte	$2d,$2d,$61,0
	.byte	EndCode1088-*-1
	dec  a
EndCode1088:

; ***** --y *****

	.byte	$2d,$2d,$79,0
	.byte	EndCode1089-*-1
	dey
EndCode1089:

; ***** <<S *****

	.byte	$3c,$3c,$53,0
	.byte	EndCode1090-*-1
	asl  $63
EndCode1090:

; ***** <<C *****

	.byte	$3c,$3c,$43,0
	.byte	EndCode1091-*-1
	asl  $7363
EndCode1091:

; ***** <<I *****

	.byte	$3c,$3c,$49,0
	.byte	EndCode1092-*-1
	asl  $63
	rol  $83
EndCode1092:

; ***** <<L *****

	.byte	$3c,$3c,$4c,0
	.byte	EndCode1093-*-1
	asl  $7363
	rol  $7383
EndCode1093:

; ***** <<r *****

	.byte	$3c,$3c,$72,0
	.byte	EndCode1094-*-1
	asl  a
	pha
	txa
	rol  a
	tax
	pla
EndCode1094:

; ***** <<a *****

	.byte	$3c,$3c,$61,0
	.byte	EndCode1095-*-1
	asl  a
EndCode1095:

; ***** >>S *****

	.byte	$3e,$3e,$53,0
	.byte	EndCode1096-*-1
	lsr  $63
EndCode1096:

; ***** >>C *****

	.byte	$3e,$3e,$43,0
	.byte	EndCode1097-*-1
	lsr  $7363
EndCode1097:

; ***** >>I *****

	.byte	$3e,$3e,$49,0
	.byte	EndCode1098-*-1
	lsr  $83
	ror  $63
EndCode1098:

; ***** >>L *****

	.byte	$3e,$3e,$4c,0
	.byte	EndCode1099-*-1
	lsr  $7383
	ror  $7363
EndCode1099:

; ***** >>r *****

	.byte	$3e,$3e,$72,0
	.byte	EndCode1100-*-1
	pha
	txa
	lsr  a
	tax
	pla
	ror  a
EndCode1100:

; ***** >>a *****

	.byte	$3e,$3e,$61,0
	.byte	EndCode1101-*-1
	lsr  a
EndCode1101:

; ***** C=r *****

	.byte	$43,$3d,$72,0
	.byte	EndCode1102-*-1
	sta  $7363
EndCode1102:

; ***** C=a *****

	.byte	$43,$3d,$61,0
	.byte	EndCode1103-*-1
	sta  $7363
EndCode1103:

; ***** C=y *****

	.byte	$43,$3d,$79,0
	.byte	EndCode1104-*-1
	sty  $7363
EndCode1104:

; ***** I=r *****

	.byte	$49,$3d,$72,0
	.byte	EndCode1105-*-1
	sta  $63
	stx  $83
EndCode1105:

; ***** L=r *****

	.byte	$4c,$3d,$72,0
	.byte	EndCode1106-*-1
	sta  $7363
	stx  $7383
EndCode1106:

; ***** S=r *****

	.byte	$53,$3d,$72,0
	.byte	EndCode1107-*-1
	sta  $63
EndCode1107:

; ***** S=a *****

	.byte	$53,$3d,$61,0
	.byte	EndCode1108-*-1
	sta  $63
EndCode1108:

; ***** S=y *****

	.byte	$53,$3d,$79,0
	.byte	EndCode1109-*-1
	sty  $63
EndCode1109:

; ***** a^B *****

	.byte	$61,$5e,$42,0
	.byte	EndCode1110-*-1
	eor  #$63
EndCode1110:

; ***** a^S *****

	.byte	$61,$5e,$53,0
	.byte	EndCode1111-*-1
	eor  $63
EndCode1111:

; ***** a^C *****

	.byte	$61,$5e,$43,0
	.byte	EndCode1112-*-1
	eor  $7363
EndCode1112:

; ***** a-B *****

	.byte	$61,$2d,$42,0
	.byte	EndCode1113-*-1
	sec
	sbc  #$63
EndCode1113:

; ***** a-S *****

	.byte	$61,$2d,$53,0
	.byte	EndCode1114-*-1
	sec
	sbc  $63
EndCode1114:

; ***** a-C *****

	.byte	$61,$2d,$43,0
	.byte	EndCode1115-*-1
	sec
	sbc  $7363
EndCode1115:

; ***** a|B *****

	.byte	$61,$7c,$42,0
	.byte	EndCode1116-*-1
	ora  #$63
EndCode1116:

; ***** a|S *****

	.byte	$61,$7c,$53,0
	.byte	EndCode1117-*-1
	ora  $63
EndCode1117:

; ***** a|C *****

	.byte	$61,$7c,$43,0
	.byte	EndCode1118-*-1
	ora  $7363
EndCode1118:

; ***** a&B *****

	.byte	$61,$26,$42,0
	.byte	EndCode1119-*-1
	and  #$63
EndCode1119:

; ***** a&S *****

	.byte	$61,$26,$53,0
	.byte	EndCode1120-*-1
	and  $63
EndCode1120:

; ***** a&C *****

	.byte	$61,$26,$43,0
	.byte	EndCode1121-*-1
	and  $7363
EndCode1121:

; ***** a+B *****

	.byte	$61,$2b,$42,0
	.byte	EndCode1122-*-1
	clc
	adc  #$63
EndCode1122:

; ***** a+S *****

	.byte	$61,$2b,$53,0
	.byte	EndCode1123-*-1
	clc
	adc  $63
EndCode1123:

; ***** a+C *****

	.byte	$61,$2b,$43,0
	.byte	EndCode1124-*-1
	clc
	adc  $7363
EndCode1124:

; ***** a=? *****

	.byte	$61,$3d,$3f,0
	.byte	EndCode1125-*-1
	cmp #0
	.byte $93
	beq *
EndCode1125:

; ***** a+? *****

	.byte	$61,$2b,$3f,0
	.byte	EndCode1126-*-1
	cmp #0
	.byte $93
	bpl *
EndCode1126:

; ***** a-? *****

	.byte	$61,$2d,$3f,0
	.byte	EndCode1127-*-1
	cmp #0
	.byte $93
	bmi *
EndCode1127:

; ***** a=y *****

	.byte	$61,$3d,$79,0
	.byte	EndCode1128-*-1
	tya
EndCode1128:

; ***** a=r *****

	.byte	$61,$3d,$72,0
	.byte	EndCode1129-*-1
EndCode1129:

; ***** a=B *****

	.byte	$61,$3d,$42,0
	.byte	EndCode1130-*-1
	lda  #$63
EndCode1130:

; ***** a=S *****

	.byte	$61,$3d,$53,0
	.byte	EndCode1131-*-1
	lda  $63
EndCode1131:

; ***** a=C *****

	.byte	$61,$3d,$43,0
	.byte	EndCode1132-*-1
	lda  $7363
EndCode1132:

; ***** cs? *****

	.byte	$63,$73,$3f,0
	.byte	EndCode1133-*-1
	.byte $93
	bcs  *
EndCode1133:

; ***** cc? *****

	.byte	$63,$63,$3f,0
	.byte	EndCode1134-*-1
	.byte $93
	bcc  *
EndCode1134:

; ***** r^B *****

	.byte	$72,$5e,$42,0
	.byte	EndCode1135-*-1
	eor  #$63
EndCode1135:

; ***** r^W *****

	.byte	$72,$5e,$57,0
	.byte	EndCode1136-*-1
	eor  #$63
	pha
	txa
	eor  #$73
	tax
	pla
EndCode1136:

; ***** r^I *****

	.byte	$72,$5e,$49,0
	.byte	EndCode1137-*-1
	eor  $63
	pha
	txa
	eor  $83
	tax
	pla
EndCode1137:

; ***** r^L *****

	.byte	$72,$5e,$4c,0
	.byte	EndCode1138-*-1
	eor  $7363
	pha
	txa
	eor  $7383
	tax
	pla
EndCode1138:

; ***** r^S *****

	.byte	$72,$5e,$53,0
	.byte	EndCode1139-*-1
	eor  $63
EndCode1139:

; ***** r^C *****

	.byte	$72,$5e,$43,0
	.byte	EndCode1140-*-1
	eor  $7363
EndCode1140:

; ***** r-B *****

	.byte	$72,$2d,$42,0
	.byte	EndCode1141-*-1
	sec
	sbc  #$63
	bcs  *+3
	dex
EndCode1141:

; ***** r-W *****

	.byte	$72,$2d,$57,0
	.byte	EndCode1142-*-1
	sec
	sbc  #$63
	pha
	txa
	sbc  #$73
	tax
	pla
EndCode1142:

; ***** r-I *****

	.byte	$72,$2d,$49,0
	.byte	EndCode1143-*-1
	sec
	sbc  $63
	pha
	txa
	sbc  $83
	tax
	pla
EndCode1143:

; ***** r-L *****

	.byte	$72,$2d,$4c,0
	.byte	EndCode1144-*-1
	sec
	sbc  $7363
	pha
	txa
	sbc  $7383
	tax
	pla
EndCode1144:

; ***** r-S *****

	.byte	$72,$2d,$53,0
	.byte	EndCode1145-*-1
	sec
	sbc  $63
	bcs  *+3
	dex
EndCode1145:

; ***** r-C *****

	.byte	$72,$2d,$43,0
	.byte	EndCode1146-*-1
	sec
	sbc  $7363
	bcs  *+3
	dex
EndCode1146:

; ***** r|B *****

	.byte	$72,$7c,$42,0
	.byte	EndCode1147-*-1
	ora  #$63
EndCode1147:

; ***** r|W *****

	.byte	$72,$7c,$57,0
	.byte	EndCode1148-*-1
	ora  #$63
	pha
	txa
	ora  #$73
	tax
	pla
EndCode1148:

; ***** r|I *****

	.byte	$72,$7c,$49,0
	.byte	EndCode1149-*-1
	ora  $63
	pha
	txa
	ora  $83
	tax
	pla
EndCode1149:

; ***** r|L *****

	.byte	$72,$7c,$4c,0
	.byte	EndCode1150-*-1
	ora  $7363
	pha
	txa
	ora  $7383
	tax
	pla
EndCode1150:

; ***** r|S *****

	.byte	$72,$7c,$53,0
	.byte	EndCode1151-*-1
	ora  $63
EndCode1151:

; ***** r|C *****

	.byte	$72,$7c,$43,0
	.byte	EndCode1152-*-1
	ora  $7363
EndCode1152:

; ***** r&B *****

	.byte	$72,$26,$42,0
	.byte	EndCode1153-*-1
	and  #$63
	ldx  #0
EndCode1153:

; ***** r&W *****

	.byte	$72,$26,$57,0
	.byte	EndCode1154-*-1
	and  #$63
	pha
	txa
	and  #$73
	tax
	pla
EndCode1154:

; ***** r&I *****

	.byte	$72,$26,$49,0
	.byte	EndCode1155-*-1
	and  $63
	pha
	txa
	and  $83
	tax
	pla
EndCode1155:

; ***** r&L *****

	.byte	$72,$26,$4c,0
	.byte	EndCode1156-*-1
	and  $7363
	pha
	txa
	and  $7383
	tax
	pla
EndCode1156:

; ***** r&S *****

	.byte	$72,$26,$53,0
	.byte	EndCode1157-*-1
	and  $63
	ldx  #0
EndCode1157:

; ***** r&C *****

	.byte	$72,$26,$43,0
	.byte	EndCode1158-*-1
	and  $7363
	ldx  #0
EndCode1158:

; ***** r+B *****

	.byte	$72,$2b,$42,0
	.byte	EndCode1159-*-1
	clc
	adc  #$63
	bcc  *+3
	inx
EndCode1159:

; ***** r+W *****

	.byte	$72,$2b,$57,0
	.byte	EndCode1160-*-1
	clc
	adc  #$63
	pha
	txa
	adc  #$73
	tax
	pla
EndCode1160:

; ***** r+I *****

	.byte	$72,$2b,$49,0
	.byte	EndCode1161-*-1
	clc
	adc  $63
	pha
	txa
	adc  $83
	tax
	pla
EndCode1161:

; ***** r+L *****

	.byte	$72,$2b,$4c,0
	.byte	EndCode1162-*-1
	clc
	adc  $7363
	pha
	txa
	adc  $7383
	tax
	pla
EndCode1162:

; ***** r+S *****

	.byte	$72,$2b,$53,0
	.byte	EndCode1163-*-1
	clc
	adc  $63
	bcc  *+3
	inx
EndCode1163:

; ***** r+C *****

	.byte	$72,$2b,$43,0
	.byte	EndCode1164-*-1
	clc
	adc  $7363
	bcc  *+3
	inx
EndCode1164:

; ***** r=? *****

	.byte	$72,$3d,$3f,0
	.byte	EndCode1165-*-1
	cmp #0
	bne *+4
	cpx #0
	.byte $93
	beq *
EndCode1165:

; ***** r+? *****

	.byte	$72,$2b,$3f,0
	.byte	EndCode1166-*-1
	cpx #0
	.byte $93
	bpl *
EndCode1166:

; ***** r-? *****

	.byte	$72,$2d,$3f,0
	.byte	EndCode1167-*-1
	cpx #0
	.byte $93
	bmi *
EndCode1167:

; ***** r=a *****

	.byte	$72,$3d,$61,0
	.byte	EndCode1168-*-1
	ldx  #0
EndCode1168:

; ***** r=y *****

	.byte	$72,$3d,$79,0
	.byte	EndCode1169-*-1
	tya
	ldx  #0
EndCode1169:

; ***** r=B *****

	.byte	$72,$3d,$42,0
	.byte	EndCode1170-*-1
	lda  #$63
	ldx  #$73
EndCode1170:

; ***** r=W *****

	.byte	$72,$3d,$57,0
	.byte	EndCode1171-*-1
	lda  #$63
	ldx  #$73
EndCode1171:

; ***** r=I *****

	.byte	$72,$3d,$49,0
	.byte	EndCode1172-*-1
	lda  $63
	ldx  $83
EndCode1172:

; ***** r=L *****

	.byte	$72,$3d,$4c,0
	.byte	EndCode1173-*-1
	lda  $7363
	ldx  $7383
EndCode1173:

; ***** r=S *****

	.byte	$72,$3d,$53,0
	.byte	EndCode1174-*-1
	lda  $63
	ldx  #0
EndCode1174:

; ***** r=C *****

	.byte	$72,$3d,$43,0
	.byte	EndCode1175-*-1
	lda  $7363
	ldx  #0
EndCode1175:

; ***** y=a *****

	.byte	$79,$3d,$61,0
	.byte	EndCode1176-*-1
	tay
EndCode1176:

; ***** y=r *****

	.byte	$79,$3d,$72,0
	.byte	EndCode1177-*-1
	tay
EndCode1177:

; ***** y=B *****

	.byte	$79,$3d,$42,0
	.byte	EndCode1178-*-1
	ldy  #$63
EndCode1178:

; ***** y=S *****

	.byte	$79,$3d,$53,0
	.byte	EndCode1179-*-1
	ldy  $63
EndCode1179:

; ***** y=C *****

	.byte	$79,$3d,$43,0
	.byte	EndCode1180-*-1
	ldy  $7363
EndCode1180:

; ***** -a *****

	.byte	$2d,$61,0
	.byte	EndCode1181-*-1
	eor  #$FF
	inc  a
EndCode1181:

; ***** -r *****

	.byte	$2d,$72,0
	.byte	EndCode1182-*-1
	pha
	txa
	eor  #$FF
	tax
	pla
	eor  #$FF
	inc  a
	bne  *+3
	inx
EndCode1182:

; ***** P* *****

	.byte	$50,$2a,0
	.byte	EndCode1183-*-1
	.byte	$a3,$0d
EndCode1183:

; ***** ^a *****

	.byte	$5e,$61,0
	.byte	EndCode1184-*-1
	eor  #$FF
EndCode1184:

; ***** ^r *****

	.byte	$5e,$72,0
	.byte	EndCode1185-*-1
	pha
	txa
	eor  #$FF
	tax
	pla
	eor  #$FF
EndCode1185:

; ***** if *****

	.byte	$69,$66,0
	.byte	EndCode1186-*-1
	.byte	$a3,$09
EndCode1186:

; ***** B *****

	.byte	$42,0
	.byte	EndCode1187-*-1
	lda  #$63
	ldx  #$73
EndCode1187:

; ***** C *****

	.byte	$43,0
	.byte	EndCode1188-*-1
	lda  $7363
	ldx  #0
EndCode1188:

; ***** I *****

	.byte	$49,0
	.byte	EndCode1189-*-1
	lda  $63
	ldx  $83
EndCode1189:

; ***** L *****

	.byte	$4c,0
	.byte	EndCode1190-*-1
	lda  $7363
	ldx  $7383
EndCode1190:

; ***** S *****

	.byte	$53,0
	.byte	EndCode1191-*-1
	lda  $63
	ldx  #0
EndCode1191:

; ***** W *****

	.byte	$57,0
	.byte	EndCode1192-*-1
	lda  #$63
	ldx  #$73
EndCode1192:
	.byte	0
