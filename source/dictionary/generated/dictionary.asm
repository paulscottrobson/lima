;
;	This code is automatically generated.
;
	* = $1000

; ***** interrupt.off *****

	.byte	$69,$6e,$74,$65,$72,$72,$75,$70,$74,$2e,$6f,$66,$66,0
	.byte	EndCode1000-*-1
	sei
EndCode1000:

; ***** clean.module *****

	.byte	$63,$6c,$65,$61,$6e,$2e,$6d,$6f,$64,$75,$6c,$65,0
	.byte	EndCode1001-*-1
	.byte	$a3,$05
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

; ***** halt *****

	.byte	$68,$61,$6c,$74,0
	.byte	EndCode1067-*-1
	bra  *
EndCode1067:

; ***** next *****

	.byte	$6e,$65,$78,$74,0
	.byte	EndCode1068-*-1
	.byte	$a3,$0a
EndCode1068:

; ***** r->s *****

	.byte	$72,$2d,$3e,$73,0
	.byte	EndCode1069-*-1
	pha
	phx
EndCode1069:

; ***** r<>? *****

	.byte	$72,$3c,$3e,$3f,0
	.byte	EndCode1070-*-1
	cmp #0
	bne *+4
	cpx #0
	.byte $93
	bne *
EndCode1070:

; ***** r<W? *****

	.byte	$72,$3c,$57,$3f,0
	.byte	EndCode1071-*-1
	cmp  #$63
	pha
	txa
	sbc  #$73
	pla
	.byte $93
	bcc *
EndCode1071:

; ***** r=W? *****

	.byte	$72,$3d,$57,$3f,0
	.byte	EndCode1072-*-1
	cmp  #$63
	bne  _Skip1
	cpx  #$73
_Skip1:
	.byte $93
	beq *
EndCode1072:

; ***** r<I? *****

	.byte	$72,$3c,$49,$3f,0
	.byte	EndCode1073-*-1
	cmp  $63
	pha
	txa
	sbc  $83
	pla
	.byte $93
	bcc *
EndCode1073:

; ***** r<L? *****

	.byte	$72,$3c,$4c,$3f,0
	.byte	EndCode1074-*-1
	cmp  $7363
	pha
	txa
	sbc  $7383
	pla
	.byte $93
	bcc *
EndCode1074:

; ***** r=I? *****

	.byte	$72,$3d,$49,$3f,0
	.byte	EndCode1075-*-1
	cmp  $63
	bne  _Skip1
	cpx  $83
_Skip1:
	.byte $93
	beq *
EndCode1075:

; ***** r=L? *****

	.byte	$72,$3d,$4c,$3f,0
	.byte	EndCode1076-*-1
	cmp  $7363
	bne  _Skip1
	cpx  $7383
_Skip1:
	.byte $93
	beq *
EndCode1076:

; ***** s->r *****

	.byte	$73,$2d,$3e,$72,0
	.byte	EndCode1077-*-1
	plx
	pla
EndCode1077:

; ***** s->a *****

	.byte	$73,$2d,$3e,$61,0
	.byte	EndCode1078-*-1
	pla
EndCode1078:

; ***** s->y *****

	.byte	$73,$2d,$3e,$79,0
	.byte	EndCode1079-*-1
	ply
EndCode1079:

; ***** y->s *****

	.byte	$79,$2d,$3e,$73,0
	.byte	EndCode1080-*-1
	phy
EndCode1080:

; ***** ++S *****

	.byte	$2b,$2b,$53,0
	.byte	EndCode1081-*-1
	inc  $63
EndCode1081:

; ***** ++C *****

	.byte	$2b,$2b,$43,0
	.byte	EndCode1082-*-1
	inc  $7363
EndCode1082:

; ***** ++I *****

	.byte	$2b,$2b,$49,0
	.byte	EndCode1083-*-1
	inc  $63
	bne  _NoCarry
	inc  $83
_NoCarry:
EndCode1083:

; ***** ++L *****

	.byte	$2b,$2b,$4c,0
	.byte	EndCode1084-*-1
	inc  $7363
	bne  _NoCarry
	inc  $7383
_NoCarry:
EndCode1084:

; ***** ++r *****

	.byte	$2b,$2b,$72,0
	.byte	EndCode1085-*-1
	inc  a
	bne  *+3
	inx
EndCode1085:

; ***** ++a *****

	.byte	$2b,$2b,$61,0
	.byte	EndCode1086-*-1
	inc  a
EndCode1086:

; ***** ++y *****

	.byte	$2b,$2b,$79,0
	.byte	EndCode1087-*-1
	iny
EndCode1087:

; ***** --S *****

	.byte	$2d,$2d,$53,0
	.byte	EndCode1088-*-1
	dec  $63
EndCode1088:

; ***** --C *****

	.byte	$2d,$2d,$43,0
	.byte	EndCode1089-*-1
	dec  $7363
EndCode1089:

; ***** --I *****

	.byte	$2d,$2d,$49,0
	.byte	EndCode1090-*-1
	pha
	lda  $63
	bne  _NoBorrow
	dec  $83
_NoBorrow:
	dec  $63
	pla
EndCode1090:

; ***** --L *****

	.byte	$2d,$2d,$4c,0
	.byte	EndCode1091-*-1
	pha
	lda  $7363
	bne  _NoBorrow
	dec  $7383
_NoBorrow:
	dec  $7363
	pla
EndCode1091:

; ***** --r *****

	.byte	$2d,$2d,$72,0
	.byte	EndCode1092-*-1
	cmp  #0
	bne  *+3
	dex
	dec  a
EndCode1092:

; ***** --a *****

	.byte	$2d,$2d,$61,0
	.byte	EndCode1093-*-1
	dec  a
EndCode1093:

; ***** --y *****

	.byte	$2d,$2d,$79,0
	.byte	EndCode1094-*-1
	dey
EndCode1094:

; ***** <<S *****

	.byte	$3c,$3c,$53,0
	.byte	EndCode1095-*-1
	asl  $63
EndCode1095:

; ***** <<C *****

	.byte	$3c,$3c,$43,0
	.byte	EndCode1096-*-1
	asl  $7363
EndCode1096:

; ***** <<I *****

	.byte	$3c,$3c,$49,0
	.byte	EndCode1097-*-1
	asl  $63
	rol  $83
EndCode1097:

; ***** <<L *****

	.byte	$3c,$3c,$4c,0
	.byte	EndCode1098-*-1
	asl  $7363
	rol  $7383
EndCode1098:

; ***** <<r *****

	.byte	$3c,$3c,$72,0
	.byte	EndCode1099-*-1
	asl  a
	pha
	txa
	rol  a
	tax
	pla
EndCode1099:

; ***** <<a *****

	.byte	$3c,$3c,$61,0
	.byte	EndCode1100-*-1
	asl  a
EndCode1100:

; ***** >>S *****

	.byte	$3e,$3e,$53,0
	.byte	EndCode1101-*-1
	lsr  $63
EndCode1101:

; ***** >>C *****

	.byte	$3e,$3e,$43,0
	.byte	EndCode1102-*-1
	lsr  $7363
EndCode1102:

; ***** >>I *****

	.byte	$3e,$3e,$49,0
	.byte	EndCode1103-*-1
	lsr  $83
	ror  $63
EndCode1103:

; ***** >>L *****

	.byte	$3e,$3e,$4c,0
	.byte	EndCode1104-*-1
	lsr  $7383
	ror  $7363
EndCode1104:

; ***** >>r *****

	.byte	$3e,$3e,$72,0
	.byte	EndCode1105-*-1
	pha
	txa
	lsr  a
	tax
	pla
	ror  a
EndCode1105:

; ***** >>a *****

	.byte	$3e,$3e,$61,0
	.byte	EndCode1106-*-1
	lsr  a
EndCode1106:

; ***** C=r *****

	.byte	$43,$3d,$72,0
	.byte	EndCode1107-*-1
	sta  $7363
EndCode1107:

; ***** C=a *****

	.byte	$43,$3d,$61,0
	.byte	EndCode1108-*-1
	sta  $7363
EndCode1108:

; ***** C=y *****

	.byte	$43,$3d,$79,0
	.byte	EndCode1109-*-1
	sty  $7363
EndCode1109:

; ***** I=r *****

	.byte	$49,$3d,$72,0
	.byte	EndCode1110-*-1
	sta  $63
	stx  $83
EndCode1110:

; ***** L=r *****

	.byte	$4c,$3d,$72,0
	.byte	EndCode1111-*-1
	sta  $7363
	stx  $7383
EndCode1111:

; ***** P(* *****

	.byte	$50,$28,$2a,0
	.byte	EndCode1112-*-1
	.byte	$a3,$0f
EndCode1112:

; ***** S=r *****

	.byte	$53,$3d,$72,0
	.byte	EndCode1113-*-1
	sta  $63
EndCode1113:

; ***** S=a *****

	.byte	$53,$3d,$61,0
	.byte	EndCode1114-*-1
	sta  $63
EndCode1114:

; ***** S=y *****

	.byte	$53,$3d,$79,0
	.byte	EndCode1115-*-1
	sty  $63
EndCode1115:

; ***** a^B *****

	.byte	$61,$5e,$42,0
	.byte	EndCode1116-*-1
	eor  #$63
EndCode1116:

; ***** a^S *****

	.byte	$61,$5e,$53,0
	.byte	EndCode1117-*-1
	eor  $63
EndCode1117:

; ***** a^C *****

	.byte	$61,$5e,$43,0
	.byte	EndCode1118-*-1
	eor  $7363
EndCode1118:

; ***** a-B *****

	.byte	$61,$2d,$42,0
	.byte	EndCode1119-*-1
	sec
	sbc  #$63
EndCode1119:

; ***** a-S *****

	.byte	$61,$2d,$53,0
	.byte	EndCode1120-*-1
	sec
	sbc  $63
EndCode1120:

; ***** a-C *****

	.byte	$61,$2d,$43,0
	.byte	EndCode1121-*-1
	sec
	sbc  $7363
EndCode1121:

; ***** a|B *****

	.byte	$61,$7c,$42,0
	.byte	EndCode1122-*-1
	ora  #$63
EndCode1122:

; ***** a|S *****

	.byte	$61,$7c,$53,0
	.byte	EndCode1123-*-1
	ora  $63
EndCode1123:

; ***** a|C *****

	.byte	$61,$7c,$43,0
	.byte	EndCode1124-*-1
	ora  $7363
EndCode1124:

; ***** a&B *****

	.byte	$61,$26,$42,0
	.byte	EndCode1125-*-1
	and  #$63
EndCode1125:

; ***** a&S *****

	.byte	$61,$26,$53,0
	.byte	EndCode1126-*-1
	and  $63
EndCode1126:

; ***** a&C *****

	.byte	$61,$26,$43,0
	.byte	EndCode1127-*-1
	and  $7363
EndCode1127:

; ***** a+B *****

	.byte	$61,$2b,$42,0
	.byte	EndCode1128-*-1
	clc
	adc  #$63
EndCode1128:

; ***** a+S *****

	.byte	$61,$2b,$53,0
	.byte	EndCode1129-*-1
	clc
	adc  $63
EndCode1129:

; ***** a+C *****

	.byte	$61,$2b,$43,0
	.byte	EndCode1130-*-1
	clc
	adc  $7363
EndCode1130:

; ***** a=? *****

	.byte	$61,$3d,$3f,0
	.byte	EndCode1131-*-1
	cmp #0
	.byte $93
	beq *
EndCode1131:

; ***** a+? *****

	.byte	$61,$2b,$3f,0
	.byte	EndCode1132-*-1
	cmp #0
	.byte $93
	bpl *
EndCode1132:

; ***** a-? *****

	.byte	$61,$2d,$3f,0
	.byte	EndCode1133-*-1
	cmp #0
	.byte $93
	bmi *
EndCode1133:

; ***** a=y *****

	.byte	$61,$3d,$79,0
	.byte	EndCode1134-*-1
	tya
EndCode1134:

; ***** a=r *****

	.byte	$61,$3d,$72,0
	.byte	EndCode1135-*-1
EndCode1135:

; ***** a=B *****

	.byte	$61,$3d,$42,0
	.byte	EndCode1136-*-1
	lda  #$63
EndCode1136:

; ***** a=S *****

	.byte	$61,$3d,$53,0
	.byte	EndCode1137-*-1
	lda  $63
EndCode1137:

; ***** a=C *****

	.byte	$61,$3d,$43,0
	.byte	EndCode1138-*-1
	lda  $7363
EndCode1138:

; ***** cs? *****

	.byte	$63,$73,$3f,0
	.byte	EndCode1139-*-1
	.byte $93
	bcs  *
EndCode1139:

; ***** cc? *****

	.byte	$63,$63,$3f,0
	.byte	EndCode1140-*-1
	.byte $93
	bcc  *
EndCode1140:

; ***** r^B *****

	.byte	$72,$5e,$42,0
	.byte	EndCode1141-*-1
	eor  #$63
EndCode1141:

; ***** r^W *****

	.byte	$72,$5e,$57,0
	.byte	EndCode1142-*-1
	eor  #$63
	pha
	txa
	eor  #$73
	tax
	pla
EndCode1142:

; ***** r^I *****

	.byte	$72,$5e,$49,0
	.byte	EndCode1143-*-1
	eor  $63
	pha
	txa
	eor  $83
	tax
	pla
EndCode1143:

; ***** r^L *****

	.byte	$72,$5e,$4c,0
	.byte	EndCode1144-*-1
	eor  $7363
	pha
	txa
	eor  $7383
	tax
	pla
EndCode1144:

; ***** r^S *****

	.byte	$72,$5e,$53,0
	.byte	EndCode1145-*-1
	eor  $63
EndCode1145:

; ***** r^C *****

	.byte	$72,$5e,$43,0
	.byte	EndCode1146-*-1
	eor  $7363
EndCode1146:

; ***** r-B *****

	.byte	$72,$2d,$42,0
	.byte	EndCode1147-*-1
	sec
	sbc  #$63
	bcs  *+3
	dex
EndCode1147:

; ***** r-W *****

	.byte	$72,$2d,$57,0
	.byte	EndCode1148-*-1
	sec
	sbc  #$63
	pha
	txa
	sbc  #$73
	tax
	pla
EndCode1148:

; ***** r-I *****

	.byte	$72,$2d,$49,0
	.byte	EndCode1149-*-1
	sec
	sbc  $63
	pha
	txa
	sbc  $83
	tax
	pla
EndCode1149:

; ***** r-L *****

	.byte	$72,$2d,$4c,0
	.byte	EndCode1150-*-1
	sec
	sbc  $7363
	pha
	txa
	sbc  $7383
	tax
	pla
EndCode1150:

; ***** r-S *****

	.byte	$72,$2d,$53,0
	.byte	EndCode1151-*-1
	sec
	sbc  $63
	bcs  *+3
	dex
EndCode1151:

; ***** r-C *****

	.byte	$72,$2d,$43,0
	.byte	EndCode1152-*-1
	sec
	sbc  $7363
	bcs  *+3
	dex
EndCode1152:

; ***** r|B *****

	.byte	$72,$7c,$42,0
	.byte	EndCode1153-*-1
	ora  #$63
EndCode1153:

; ***** r|W *****

	.byte	$72,$7c,$57,0
	.byte	EndCode1154-*-1
	ora  #$63
	pha
	txa
	ora  #$73
	tax
	pla
EndCode1154:

; ***** r|I *****

	.byte	$72,$7c,$49,0
	.byte	EndCode1155-*-1
	ora  $63
	pha
	txa
	ora  $83
	tax
	pla
EndCode1155:

; ***** r|L *****

	.byte	$72,$7c,$4c,0
	.byte	EndCode1156-*-1
	ora  $7363
	pha
	txa
	ora  $7383
	tax
	pla
EndCode1156:

; ***** r|S *****

	.byte	$72,$7c,$53,0
	.byte	EndCode1157-*-1
	ora  $63
EndCode1157:

; ***** r|C *****

	.byte	$72,$7c,$43,0
	.byte	EndCode1158-*-1
	ora  $7363
EndCode1158:

; ***** r&B *****

	.byte	$72,$26,$42,0
	.byte	EndCode1159-*-1
	and  #$63
	ldx  #0
EndCode1159:

; ***** r&W *****

	.byte	$72,$26,$57,0
	.byte	EndCode1160-*-1
	and  #$63
	pha
	txa
	and  #$73
	tax
	pla
EndCode1160:

; ***** r&I *****

	.byte	$72,$26,$49,0
	.byte	EndCode1161-*-1
	and  $63
	pha
	txa
	and  $83
	tax
	pla
EndCode1161:

; ***** r&L *****

	.byte	$72,$26,$4c,0
	.byte	EndCode1162-*-1
	and  $7363
	pha
	txa
	and  $7383
	tax
	pla
EndCode1162:

; ***** r&S *****

	.byte	$72,$26,$53,0
	.byte	EndCode1163-*-1
	and  $63
	ldx  #0
EndCode1163:

; ***** r&C *****

	.byte	$72,$26,$43,0
	.byte	EndCode1164-*-1
	and  $7363
	ldx  #0
EndCode1164:

; ***** r+B *****

	.byte	$72,$2b,$42,0
	.byte	EndCode1165-*-1
	clc
	adc  #$63
	bcc  *+3
	inx
EndCode1165:

; ***** r+W *****

	.byte	$72,$2b,$57,0
	.byte	EndCode1166-*-1
	clc
	adc  #$63
	pha
	txa
	adc  #$73
	tax
	pla
EndCode1166:

; ***** r+I *****

	.byte	$72,$2b,$49,0
	.byte	EndCode1167-*-1
	clc
	adc  $63
	pha
	txa
	adc  $83
	tax
	pla
EndCode1167:

; ***** r+L *****

	.byte	$72,$2b,$4c,0
	.byte	EndCode1168-*-1
	clc
	adc  $7363
	pha
	txa
	adc  $7383
	tax
	pla
EndCode1168:

; ***** r+S *****

	.byte	$72,$2b,$53,0
	.byte	EndCode1169-*-1
	clc
	adc  $63
	bcc  *+3
	inx
EndCode1169:

; ***** r+C *****

	.byte	$72,$2b,$43,0
	.byte	EndCode1170-*-1
	clc
	adc  $7363
	bcc  *+3
	inx
EndCode1170:

; ***** r=? *****

	.byte	$72,$3d,$3f,0
	.byte	EndCode1171-*-1
	cmp #0
	bne *+4
	cpx #0
	.byte $93
	beq *
EndCode1171:

; ***** r+? *****

	.byte	$72,$2b,$3f,0
	.byte	EndCode1172-*-1
	cpx #0
	.byte $93
	bpl *
EndCode1172:

; ***** r-? *****

	.byte	$72,$2d,$3f,0
	.byte	EndCode1173-*-1
	cpx #0
	.byte $93
	bmi *
EndCode1173:

; ***** r=a *****

	.byte	$72,$3d,$61,0
	.byte	EndCode1174-*-1
	ldx  #0
EndCode1174:

; ***** r=y *****

	.byte	$72,$3d,$79,0
	.byte	EndCode1175-*-1
	tya
	ldx  #0
EndCode1175:

; ***** r=B *****

	.byte	$72,$3d,$42,0
	.byte	EndCode1176-*-1
	lda  #$63
	ldx  #$73
EndCode1176:

; ***** r=W *****

	.byte	$72,$3d,$57,0
	.byte	EndCode1177-*-1
	lda  #$63
	ldx  #$73
EndCode1177:

; ***** r=I *****

	.byte	$72,$3d,$49,0
	.byte	EndCode1178-*-1
	lda  $63
	ldx  $83
EndCode1178:

; ***** r=L *****

	.byte	$72,$3d,$4c,0
	.byte	EndCode1179-*-1
	lda  $7363
	ldx  $7383
EndCode1179:

; ***** r=S *****

	.byte	$72,$3d,$53,0
	.byte	EndCode1180-*-1
	lda  $63
	ldx  #0
EndCode1180:

; ***** r=C *****

	.byte	$72,$3d,$43,0
	.byte	EndCode1181-*-1
	lda  $7363
	ldx  #0
EndCode1181:

; ***** y=a *****

	.byte	$79,$3d,$61,0
	.byte	EndCode1182-*-1
	tay
EndCode1182:

; ***** y=r *****

	.byte	$79,$3d,$72,0
	.byte	EndCode1183-*-1
	tay
EndCode1183:

; ***** y=B *****

	.byte	$79,$3d,$42,0
	.byte	EndCode1184-*-1
	ldy  #$63
EndCode1184:

; ***** y=S *****

	.byte	$79,$3d,$53,0
	.byte	EndCode1185-*-1
	ldy  $63
EndCode1185:

; ***** y=C *****

	.byte	$79,$3d,$43,0
	.byte	EndCode1186-*-1
	ldy  $7363
EndCode1186:

; ***** -a *****

	.byte	$2d,$61,0
	.byte	EndCode1187-*-1
	eor  #$FF
	inc  a
EndCode1187:

; ***** -r *****

	.byte	$2d,$72,0
	.byte	EndCode1188-*-1
	pha
	txa
	eor  #$FF
	tax
	pla
	eor  #$FF
	inc  a
	bne  *+3
	inx
EndCode1188:

; ***** ^a *****

	.byte	$5e,$61,0
	.byte	EndCode1189-*-1
	eor  #$FF
EndCode1189:

; ***** ^r *****

	.byte	$5e,$72,0
	.byte	EndCode1190-*-1
	pha
	txa
	eor  #$FF
	tax
	pla
	eor  #$FF
EndCode1190:

; ***** if *****

	.byte	$69,$66,0
	.byte	EndCode1191-*-1
	.byte	$a3,$0b
EndCode1191:

; ***** B *****

	.byte	$42,0
	.byte	EndCode1192-*-1
	lda  #$63
	ldx  #$73
EndCode1192:

; ***** C *****

	.byte	$43,0
	.byte	EndCode1193-*-1
	lda  $7363
	ldx  #0
EndCode1193:

; ***** I *****

	.byte	$49,0
	.byte	EndCode1194-*-1
	lda  $63
	ldx  $83
EndCode1194:

; ***** L *****

	.byte	$4c,0
	.byte	EndCode1195-*-1
	lda  $7363
	ldx  $7383
EndCode1195:

; ***** S *****

	.byte	$53,0
	.byte	EndCode1196-*-1
	lda  $63
	ldx  #0
EndCode1196:

; ***** W *****

	.byte	$57,0
	.byte	EndCode1197-*-1
	lda  #$63
	ldx  #$73
EndCode1197:
	.byte	0
