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

; ***** inline* *****

	.byte	$69,$6e,$6c,$69,$6e,$65,$2a,0
	.byte	EndCode1004-*-1
	.byte	$a3,$11
EndCode1004:

; ***** I[y]=a *****

	.byte	$49,$5b,$79,$5d,$3d,$61,0
	.byte	EndCode1005-*-1
	sta  ($63 & $FF),y
EndCode1005:

; ***** I[y]=r *****

	.byte	$49,$5b,$79,$5d,$3d,$72,0
	.byte	EndCode1006-*-1
	sta  ($63 & $FF),y
	iny
	txa
	sta  ($63 & $FF),y
	dey
	lda  ($63 & $FF),y
EndCode1006:

; ***** L[y]=a *****

	.byte	$4c,$5b,$79,$5d,$3d,$61,0
	.byte	EndCode1007-*-1
	sta  ($7363 & $FF),y
EndCode1007:

; ***** L[y]=r *****

	.byte	$4c,$5b,$79,$5d,$3d,$72,0
	.byte	EndCode1008-*-1
	sta  ($7363 & $FF),y
	iny
	txa
	sta  ($7363 & $FF),y
	dey
	lda  ($7363 & $FF),y
EndCode1008:

; ***** a-I[y] *****

	.byte	$61,$2d,$49,$5b,$79,$5d,0
	.byte	EndCode1009-*-1
	sec
	sbc  ($63& $FF),y
EndCode1009:

; ***** a-L[y] *****

	.byte	$61,$2d,$4c,$5b,$79,$5d,0
	.byte	EndCode1010-*-1
	sec
	sbc  ($7363& $FF),y
EndCode1010:

; ***** a^I[y] *****

	.byte	$61,$5e,$49,$5b,$79,$5d,0
	.byte	EndCode1011-*-1
	eor  ($63 & $FF),y
EndCode1011:

; ***** a^L[y] *****

	.byte	$61,$5e,$4c,$5b,$79,$5d,0
	.byte	EndCode1012-*-1
	eor  ($7363 & $FF),y
EndCode1012:

; ***** a&I[y] *****

	.byte	$61,$26,$49,$5b,$79,$5d,0
	.byte	EndCode1013-*-1
	and  ($63& $FF),y
EndCode1013:

; ***** a&L[y] *****

	.byte	$61,$26,$4c,$5b,$79,$5d,0
	.byte	EndCode1014-*-1
	and  ($7363& $FF),y
EndCode1014:

; ***** a|I[y] *****

	.byte	$61,$7c,$49,$5b,$79,$5d,0
	.byte	EndCode1015-*-1
	ora  ($63& $FF),y
EndCode1015:

; ***** a|L[y] *****

	.byte	$61,$7c,$4c,$5b,$79,$5d,0
	.byte	EndCode1016-*-1
	ora  ($7363& $FF),y
EndCode1016:

; ***** a+I[y] *****

	.byte	$61,$2b,$49,$5b,$79,$5d,0
	.byte	EndCode1017-*-1
	clc
	adc  ($63& $FF),y
EndCode1017:

; ***** a+L[y] *****

	.byte	$61,$2b,$4c,$5b,$79,$5d,0
	.byte	EndCode1018-*-1
	clc
	adc  ($7363& $FF),y
EndCode1018:

; ***** a=I[y] *****

	.byte	$61,$3d,$49,$5b,$79,$5d,0
	.byte	EndCode1019-*-1
	lda  ($63 & $FF),y
EndCode1019:

; ***** a=L[y] *****

	.byte	$61,$3d,$4c,$5b,$79,$5d,0
	.byte	EndCode1020-*-1
	lda  ($7363 & $FF),y
EndCode1020:

; ***** cpu->s *****

	.byte	$63,$70,$75,$2d,$3e,$73,0
	.byte	EndCode1021-*-1
	pha
	phx
	phy
EndCode1021:

; ***** r.swap *****

	.byte	$72,$2e,$73,$77,$61,$70,0
	.byte	EndCode1022-*-1
	pha
	txa
	plx
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

; ***** r^I[y] *****

	.byte	$72,$5e,$49,$5b,$79,$5d,0
	.byte	EndCode1025-*-1
	eor  ($63 & $FF),y
	pha
	txa
	iny
	eor  ($63 & $FF),y
	dey
	tax
	pla
EndCode1025:

; ***** r^L[y] *****

	.byte	$72,$5e,$4c,$5b,$79,$5d,0
	.byte	EndCode1026-*-1
	eor  ($7363 & $FF),y
	pha
	txa
	iny
	eor  ($7363 & $FF),y
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

; ***** r|I[y] *****

	.byte	$72,$7c,$49,$5b,$79,$5d,0
	.byte	EndCode1029-*-1
	ora  ($63& $FF),y
	pha
	txa
	iny
	ora  ($63& $FF),y
	dey
	tax
	pla
EndCode1029:

; ***** r|L[y] *****

	.byte	$72,$7c,$4c,$5b,$79,$5d,0
	.byte	EndCode1030-*-1
	ora  ($7363& $FF),y
	pha
	txa
	iny
	ora  ($7363& $FF),y
	dey
	tax
	pla
EndCode1030:

; ***** r+I[y] *****

	.byte	$72,$2b,$49,$5b,$79,$5d,0
	.byte	EndCode1031-*-1
	clc
	adc  ($63& $FF),y
	pha
	txa
	iny
	adc  ($63& $FF),y
	dey
	tax
	pla
EndCode1031:

; ***** r+L[y] *****

	.byte	$72,$2b,$4c,$5b,$79,$5d,0
	.byte	EndCode1032-*-1
	clc
	adc  ($7363& $FF),y
	pha
	txa
	iny
	adc  ($7363& $FF),y
	dey
	tax
	pla
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

; ***** repeat *****

	.byte	$72,$65,$70,$65,$61,$74,0
	.byte	EndCode1035-*-1
	.byte	$a3,$06
EndCode1035:

; ***** s->cpu *****

	.byte	$73,$2d,$3e,$63,$70,$75,0
	.byte	EndCode1036-*-1
	ply
	plx
	pla
EndCode1036:

; ***** zbyte* *****

	.byte	$7a,$62,$79,$74,$65,$2a,0
	.byte	EndCode1037-*-1
	.byte	$a3,$03
EndCode1037:

; ***** zword* *****

	.byte	$7a,$77,$6f,$72,$64,$2a,0
	.byte	EndCode1038-*-1
	.byte	$a3,$04
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

; ***** a.for *****

	.byte	$61,$2e,$66,$6f,$72,0
	.byte	EndCode1045-*-1
	.byte	$a3,$08
EndCode1045:

; ***** byte* *****

	.byte	$62,$79,$74,$65,$2a,0
	.byte	EndCode1046-*-1
	.byte	$a3,$01
EndCode1046:

; ***** break *****

	.byte	$62,$72,$65,$61,$6b,0
	.byte	EndCode1047-*-1
	.byte  $DB
EndCode1047:

; ***** endif *****

	.byte	$65,$6e,$64,$69,$66,0
	.byte	EndCode1048-*-1
	.byte	$a3,$0d
EndCode1048:

; ***** proc* *****

	.byte	$70,$72,$6f,$63,$2a,0
	.byte	EndCode1049-*-1
	.byte	$a3,$0e
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

; ***** r.for *****

	.byte	$72,$2e,$66,$6f,$72,0
	.byte	EndCode1056-*-1
	.byte	$a3,$09
EndCode1056:

; ***** until *****

	.byte	$75,$6e,$74,$69,$6c,0
	.byte	EndCode1057-*-1
	.byte	$a3,$07
EndCode1057:

; ***** word* *****

	.byte	$77,$6f,$72,$64,$2a,0
	.byte	EndCode1058-*-1
	.byte	$a3,$02
EndCode1058:

; ***** y>=S? *****

	.byte	$79,$3e,$3d,$53,$3f,0
	.byte	EndCode1059-*-1
	cpy  $63
	.byte $93
	bcs *
EndCode1059:

; ***** y>=C? *****

	.byte	$79,$3e,$3d,$43,$3f,0
	.byte	EndCode1060-*-1
	cpy  $7363
	.byte $93
	bcs *
EndCode1060:

; ***** y<>S? *****

	.byte	$79,$3c,$3e,$53,$3f,0
	.byte	EndCode1061-*-1
	cpy  $63
	.byte $93
	bne *
EndCode1061:

; ***** y<>C? *****

	.byte	$79,$3c,$3e,$43,$3f,0
	.byte	EndCode1062-*-1
	cpy  $7363
	.byte $93
	bne *
EndCode1062:

; ***** y>=B? *****

	.byte	$79,$3e,$3d,$42,$3f,0
	.byte	EndCode1063-*-1
	cpy  #$63
	.byte $93
	bcs *
EndCode1063:

; ***** y<>B? *****

	.byte	$79,$3c,$3e,$42,$3f,0
	.byte	EndCode1064-*-1
	cpy  #$63
	.byte $93
	bne *
EndCode1064:

; ***** a<>? *****

	.byte	$61,$3c,$3e,$3f,0
	.byte	EndCode1065-*-1
	cmp #0
	.byte $93
	bne *
EndCode1065:

; ***** a<S? *****

	.byte	$61,$3c,$53,$3f,0
	.byte	EndCode1066-*-1
	cmp  $63
	.byte $93
	bcc *
EndCode1066:

; ***** a<C? *****

	.byte	$61,$3c,$43,$3f,0
	.byte	EndCode1067-*-1
	cmp  $7363
	.byte $93
	bcc *
EndCode1067:

; ***** a=S? *****

	.byte	$61,$3d,$53,$3f,0
	.byte	EndCode1068-*-1
	cmp  $63
	.byte $93
	beq *
EndCode1068:

; ***** a=C? *****

	.byte	$61,$3d,$43,$3f,0
	.byte	EndCode1069-*-1
	cmp  $7363
	.byte $93
	beq *
EndCode1069:

; ***** a<B? *****

	.byte	$61,$3c,$42,$3f,0
	.byte	EndCode1070-*-1
	cmp  #$63
	.byte $93
	bcc *
EndCode1070:

; ***** a=B? *****

	.byte	$61,$3d,$42,$3f,0
	.byte	EndCode1071-*-1
	cmp  #$63
	.byte $93
	beq *
EndCode1071:

; ***** a->s *****

	.byte	$61,$2d,$3e,$73,0
	.byte	EndCode1072-*-1
	pha
EndCode1072:

; ***** else *****

	.byte	$65,$6c,$73,$65,0
	.byte	EndCode1073-*-1
	.byte	$a3,$0c
EndCode1073:

; ***** halt *****

	.byte	$68,$61,$6c,$74,0
	.byte	EndCode1074-*-1
	bra  *
EndCode1074:

; ***** next *****

	.byte	$6e,$65,$78,$74,0
	.byte	EndCode1075-*-1
	.byte	$a3,$0a
EndCode1075:

; ***** r<>? *****

	.byte	$72,$3c,$3e,$3f,0
	.byte	EndCode1076-*-1
	cmp #0
	bne *+4
	cpx #0
	.byte $93
	bne *
EndCode1076:

; ***** r<W? *****

	.byte	$72,$3c,$57,$3f,0
	.byte	EndCode1077-*-1
	cmp  #$63
	pha
	txa
	sbc  #$73
	pla
	.byte $93
	bcc *
EndCode1077:

; ***** r=W? *****

	.byte	$72,$3d,$57,$3f,0
	.byte	EndCode1078-*-1
	cmp  #$63
	bne  _Skip1
	cpx  #$73
_Skip1:
	.byte $93
	beq *
EndCode1078:

; ***** r<I? *****

	.byte	$72,$3c,$49,$3f,0
	.byte	EndCode1079-*-1
	cmp  $63
	pha
	txa
	sbc  $83
	pla
	.byte $93
	bcc *
EndCode1079:

; ***** r<L? *****

	.byte	$72,$3c,$4c,$3f,0
	.byte	EndCode1080-*-1
	cmp  $7363
	pha
	txa
	sbc  $7383
	pla
	.byte $93
	bcc *
EndCode1080:

; ***** r=I? *****

	.byte	$72,$3d,$49,$3f,0
	.byte	EndCode1081-*-1
	cmp  $63
	bne  _Skip1
	cpx  $83
_Skip1:
	.byte $93
	beq *
EndCode1081:

; ***** r=L? *****

	.byte	$72,$3d,$4c,$3f,0
	.byte	EndCode1082-*-1
	cmp  $7363
	bne  _Skip1
	cpx  $7383
_Skip1:
	.byte $93
	beq *
EndCode1082:

; ***** r->s *****

	.byte	$72,$2d,$3e,$73,0
	.byte	EndCode1083-*-1
	pha
	phx
EndCode1083:

; ***** s->r *****

	.byte	$73,$2d,$3e,$72,0
	.byte	EndCode1084-*-1
	plx
	pla
EndCode1084:

; ***** s->a *****

	.byte	$73,$2d,$3e,$61,0
	.byte	EndCode1085-*-1
	pla
EndCode1085:

; ***** s->y *****

	.byte	$73,$2d,$3e,$79,0
	.byte	EndCode1086-*-1
	ply
EndCode1086:

; ***** y<>? *****

	.byte	$79,$3c,$3e,$3f,0
	.byte	EndCode1087-*-1
	cpy #0
	.byte $93
	bne *
EndCode1087:

; ***** y<S? *****

	.byte	$79,$3c,$53,$3f,0
	.byte	EndCode1088-*-1
	cpy  $63
	.byte $93
	bcc *
EndCode1088:

; ***** y<C? *****

	.byte	$79,$3c,$43,$3f,0
	.byte	EndCode1089-*-1
	cpy  $7363
	.byte $93
	bcc *
EndCode1089:

; ***** y=S? *****

	.byte	$79,$3d,$53,$3f,0
	.byte	EndCode1090-*-1
	cpy  $63
	.byte $93
	beq *
EndCode1090:

; ***** y=C? *****

	.byte	$79,$3d,$43,$3f,0
	.byte	EndCode1091-*-1
	cpy  $7363
	.byte $93
	beq *
EndCode1091:

; ***** y<B? *****

	.byte	$79,$3c,$42,$3f,0
	.byte	EndCode1092-*-1
	cpy  #$63
	.byte $93
	bcc *
EndCode1092:

; ***** y=B? *****

	.byte	$79,$3d,$42,$3f,0
	.byte	EndCode1093-*-1
	cpy  #$63
	.byte $93
	beq *
EndCode1093:

; ***** y->s *****

	.byte	$79,$2d,$3e,$73,0
	.byte	EndCode1094-*-1
	phy
EndCode1094:

; ***** ++S *****

	.byte	$2b,$2b,$53,0
	.byte	EndCode1095-*-1
	inc  $63
EndCode1095:

; ***** ++C *****

	.byte	$2b,$2b,$43,0
	.byte	EndCode1096-*-1
	inc  $7363
EndCode1096:

; ***** ++I *****

	.byte	$2b,$2b,$49,0
	.byte	EndCode1097-*-1
	inc  $63
	bne  _NoCarry
	inc  $83
_NoCarry:
EndCode1097:

; ***** ++L *****

	.byte	$2b,$2b,$4c,0
	.byte	EndCode1098-*-1
	inc  $7363
	bne  _NoCarry
	inc  $7383
_NoCarry:
EndCode1098:

; ***** ++r *****

	.byte	$2b,$2b,$72,0
	.byte	EndCode1099-*-1
	inc  a
	bne  *+3
	inx
EndCode1099:

; ***** ++a *****

	.byte	$2b,$2b,$61,0
	.byte	EndCode1100-*-1
	inc  a
EndCode1100:

; ***** ++y *****

	.byte	$2b,$2b,$79,0
	.byte	EndCode1101-*-1
	iny
EndCode1101:

; ***** --S *****

	.byte	$2d,$2d,$53,0
	.byte	EndCode1102-*-1
	dec  $63
EndCode1102:

; ***** --C *****

	.byte	$2d,$2d,$43,0
	.byte	EndCode1103-*-1
	dec  $7363
EndCode1103:

; ***** --I *****

	.byte	$2d,$2d,$49,0
	.byte	EndCode1104-*-1
	pha
	lda  $63
	bne  _NoBorrow
	dec  $83
_NoBorrow:
	dec  $63
	pla
EndCode1104:

; ***** --L *****

	.byte	$2d,$2d,$4c,0
	.byte	EndCode1105-*-1
	pha
	lda  $7363
	bne  _NoBorrow
	dec  $7383
_NoBorrow:
	dec  $7363
	pla
EndCode1105:

; ***** --r *****

	.byte	$2d,$2d,$72,0
	.byte	EndCode1106-*-1
	cmp  #0
	bne  *+3
	dex
	dec  a
EndCode1106:

; ***** --a *****

	.byte	$2d,$2d,$61,0
	.byte	EndCode1107-*-1
	dec  a
EndCode1107:

; ***** --y *****

	.byte	$2d,$2d,$79,0
	.byte	EndCode1108-*-1
	dey
EndCode1108:

; ***** <<S *****

	.byte	$3c,$3c,$53,0
	.byte	EndCode1109-*-1
	asl  $63
EndCode1109:

; ***** <<C *****

	.byte	$3c,$3c,$43,0
	.byte	EndCode1110-*-1
	asl  $7363
EndCode1110:

; ***** <<I *****

	.byte	$3c,$3c,$49,0
	.byte	EndCode1111-*-1
	asl  $63
	rol  $83
EndCode1111:

; ***** <<L *****

	.byte	$3c,$3c,$4c,0
	.byte	EndCode1112-*-1
	asl  $7363
	rol  $7383
EndCode1112:

; ***** <<r *****

	.byte	$3c,$3c,$72,0
	.byte	EndCode1113-*-1
	asl  a
	pha
	txa
	rol  a
	tax
	pla
EndCode1113:

; ***** <<a *****

	.byte	$3c,$3c,$61,0
	.byte	EndCode1114-*-1
	asl  a
EndCode1114:

; ***** >>S *****

	.byte	$3e,$3e,$53,0
	.byte	EndCode1115-*-1
	lsr  $63
EndCode1115:

; ***** >>C *****

	.byte	$3e,$3e,$43,0
	.byte	EndCode1116-*-1
	lsr  $7363
EndCode1116:

; ***** >>I *****

	.byte	$3e,$3e,$49,0
	.byte	EndCode1117-*-1
	lsr  $83
	ror  $63
EndCode1117:

; ***** >>L *****

	.byte	$3e,$3e,$4c,0
	.byte	EndCode1118-*-1
	lsr  $7383
	ror  $7363
EndCode1118:

; ***** >>r *****

	.byte	$3e,$3e,$72,0
	.byte	EndCode1119-*-1
	pha
	txa
	lsr  a
	tax
	pla
	ror  a
EndCode1119:

; ***** >>a *****

	.byte	$3e,$3e,$61,0
	.byte	EndCode1120-*-1
	lsr  a
EndCode1120:

; ***** C=r *****

	.byte	$43,$3d,$72,0
	.byte	EndCode1121-*-1
	sta  $7363
EndCode1121:

; ***** C=a *****

	.byte	$43,$3d,$61,0
	.byte	EndCode1122-*-1
	sta  $7363
EndCode1122:

; ***** C=y *****

	.byte	$43,$3d,$79,0
	.byte	EndCode1123-*-1
	sty  $7363
EndCode1123:

; ***** I=r *****

	.byte	$49,$3d,$72,0
	.byte	EndCode1124-*-1
	sta  $63
	stx  $83
EndCode1124:

; ***** L=r *****

	.byte	$4c,$3d,$72,0
	.byte	EndCode1125-*-1
	sta  $7363
	stx  $7383
EndCode1125:

; ***** P(* *****

	.byte	$50,$28,$2a,0
	.byte	EndCode1126-*-1
	.byte	$a3,$0f
EndCode1126:

; ***** S=r *****

	.byte	$53,$3d,$72,0
	.byte	EndCode1127-*-1
	sta  $63
EndCode1127:

; ***** S=a *****

	.byte	$53,$3d,$61,0
	.byte	EndCode1128-*-1
	sta  $63
EndCode1128:

; ***** S=y *****

	.byte	$53,$3d,$79,0
	.byte	EndCode1129-*-1
	sty  $63
EndCode1129:

; ***** a-B *****

	.byte	$61,$2d,$42,0
	.byte	EndCode1130-*-1
	sec
	sbc  #$63
EndCode1130:

; ***** a-S *****

	.byte	$61,$2d,$53,0
	.byte	EndCode1131-*-1
	sec
	sbc  $63
EndCode1131:

; ***** a-C *****

	.byte	$61,$2d,$43,0
	.byte	EndCode1132-*-1
	sec
	sbc  $7363
EndCode1132:

; ***** a^B *****

	.byte	$61,$5e,$42,0
	.byte	EndCode1133-*-1
	eor  #$63
EndCode1133:

; ***** a^S *****

	.byte	$61,$5e,$53,0
	.byte	EndCode1134-*-1
	eor  $63
EndCode1134:

; ***** a^C *****

	.byte	$61,$5e,$43,0
	.byte	EndCode1135-*-1
	eor  $7363
EndCode1135:

; ***** a&B *****

	.byte	$61,$26,$42,0
	.byte	EndCode1136-*-1
	and  #$63
EndCode1136:

; ***** a&S *****

	.byte	$61,$26,$53,0
	.byte	EndCode1137-*-1
	and  $63
EndCode1137:

; ***** a&C *****

	.byte	$61,$26,$43,0
	.byte	EndCode1138-*-1
	and  $7363
EndCode1138:

; ***** a|B *****

	.byte	$61,$7c,$42,0
	.byte	EndCode1139-*-1
	ora  #$63
EndCode1139:

; ***** a|S *****

	.byte	$61,$7c,$53,0
	.byte	EndCode1140-*-1
	ora  $63
EndCode1140:

; ***** a|C *****

	.byte	$61,$7c,$43,0
	.byte	EndCode1141-*-1
	ora  $7363
EndCode1141:

; ***** a+B *****

	.byte	$61,$2b,$42,0
	.byte	EndCode1142-*-1
	clc
	adc  #$63
EndCode1142:

; ***** a+S *****

	.byte	$61,$2b,$53,0
	.byte	EndCode1143-*-1
	clc
	adc  $63
EndCode1143:

; ***** a+C *****

	.byte	$61,$2b,$43,0
	.byte	EndCode1144-*-1
	clc
	adc  $7363
EndCode1144:

; ***** a=B *****

	.byte	$61,$3d,$42,0
	.byte	EndCode1145-*-1
	lda  #$63
EndCode1145:

; ***** a=S *****

	.byte	$61,$3d,$53,0
	.byte	EndCode1146-*-1
	lda  $63
EndCode1146:

; ***** a=C *****

	.byte	$61,$3d,$43,0
	.byte	EndCode1147-*-1
	lda  $7363
EndCode1147:

; ***** a=y *****

	.byte	$61,$3d,$79,0
	.byte	EndCode1148-*-1
	tya
EndCode1148:

; ***** a=r *****

	.byte	$61,$3d,$72,0
	.byte	EndCode1149-*-1
EndCode1149:

; ***** a=a *****

	.byte	$61,$3d,$61,0
	.byte	EndCode1150-*-1
EndCode1150:

; ***** a=? *****

	.byte	$61,$3d,$3f,0
	.byte	EndCode1151-*-1
	cmp #0
	.byte $93
	beq *
EndCode1151:

; ***** a+? *****

	.byte	$61,$2b,$3f,0
	.byte	EndCode1152-*-1
	cmp #0
	.byte $93
	bpl *
EndCode1152:

; ***** a-? *****

	.byte	$61,$2d,$3f,0
	.byte	EndCode1153-*-1
	cmp #0
	.byte $93
	bmi *
EndCode1153:

; ***** cs? *****

	.byte	$63,$73,$3f,0
	.byte	EndCode1154-*-1
	.byte $93
	bcs  *
EndCode1154:

; ***** cc? *****

	.byte	$63,$63,$3f,0
	.byte	EndCode1155-*-1
	.byte $93
	bcc  *
EndCode1155:

; ***** r-B *****

	.byte	$72,$2d,$42,0
	.byte	EndCode1156-*-1
	sec
	sbc  #$63
	bcs  *+3
	dex
EndCode1156:

; ***** r-W *****

	.byte	$72,$2d,$57,0
	.byte	EndCode1157-*-1
	sec
	sbc  #$63
	pha
	txa
	sbc  #$73
	tax
	pla
EndCode1157:

; ***** r-I *****

	.byte	$72,$2d,$49,0
	.byte	EndCode1158-*-1
	sec
	sbc  $63
	pha
	txa
	sbc  $83
	tax
	pla
EndCode1158:

; ***** r-L *****

	.byte	$72,$2d,$4c,0
	.byte	EndCode1159-*-1
	sec
	sbc  $7363
	pha
	txa
	sbc  $7383
	tax
	pla
EndCode1159:

; ***** r-S *****

	.byte	$72,$2d,$53,0
	.byte	EndCode1160-*-1
	sec
	sbc  $63
	bcs  *+3
	dex
EndCode1160:

; ***** r-C *****

	.byte	$72,$2d,$43,0
	.byte	EndCode1161-*-1
	sec
	sbc  $7363
	bcs  *+3
	dex
EndCode1161:

; ***** r^B *****

	.byte	$72,$5e,$42,0
	.byte	EndCode1162-*-1
	eor  #$63
EndCode1162:

; ***** r^W *****

	.byte	$72,$5e,$57,0
	.byte	EndCode1163-*-1
	eor  #$63
	pha
	txa
	eor  #$73
	tax
	pla
EndCode1163:

; ***** r^I *****

	.byte	$72,$5e,$49,0
	.byte	EndCode1164-*-1
	eor  $63
	pha
	txa
	eor  $83
	tax
	pla
EndCode1164:

; ***** r^L *****

	.byte	$72,$5e,$4c,0
	.byte	EndCode1165-*-1
	eor  $7363
	pha
	txa
	eor  $7383
	tax
	pla
EndCode1165:

; ***** r^S *****

	.byte	$72,$5e,$53,0
	.byte	EndCode1166-*-1
	eor  $63
EndCode1166:

; ***** r^C *****

	.byte	$72,$5e,$43,0
	.byte	EndCode1167-*-1
	eor  $7363
EndCode1167:

; ***** r&B *****

	.byte	$72,$26,$42,0
	.byte	EndCode1168-*-1
	and  #$63
	ldx  #0
EndCode1168:

; ***** r&W *****

	.byte	$72,$26,$57,0
	.byte	EndCode1169-*-1
	and  #$63
	pha
	txa
	and  #$73
	tax
	pla
EndCode1169:

; ***** r&I *****

	.byte	$72,$26,$49,0
	.byte	EndCode1170-*-1
	and  $63
	pha
	txa
	and  $83
	tax
	pla
EndCode1170:

; ***** r&L *****

	.byte	$72,$26,$4c,0
	.byte	EndCode1171-*-1
	and  $7363
	pha
	txa
	and  $7383
	tax
	pla
EndCode1171:

; ***** r&S *****

	.byte	$72,$26,$53,0
	.byte	EndCode1172-*-1
	and  $63
	ldx  #0
EndCode1172:

; ***** r&C *****

	.byte	$72,$26,$43,0
	.byte	EndCode1173-*-1
	and  $7363
	ldx  #0
EndCode1173:

; ***** r|B *****

	.byte	$72,$7c,$42,0
	.byte	EndCode1174-*-1
	ora  #$63
EndCode1174:

; ***** r|W *****

	.byte	$72,$7c,$57,0
	.byte	EndCode1175-*-1
	ora  #$63
	pha
	txa
	ora  #$73
	tax
	pla
EndCode1175:

; ***** r|I *****

	.byte	$72,$7c,$49,0
	.byte	EndCode1176-*-1
	ora  $63
	pha
	txa
	ora  $83
	tax
	pla
EndCode1176:

; ***** r|L *****

	.byte	$72,$7c,$4c,0
	.byte	EndCode1177-*-1
	ora  $7363
	pha
	txa
	ora  $7383
	tax
	pla
EndCode1177:

; ***** r|S *****

	.byte	$72,$7c,$53,0
	.byte	EndCode1178-*-1
	ora  $63
EndCode1178:

; ***** r|C *****

	.byte	$72,$7c,$43,0
	.byte	EndCode1179-*-1
	ora  $7363
EndCode1179:

; ***** r+B *****

	.byte	$72,$2b,$42,0
	.byte	EndCode1180-*-1
	clc
	adc  #$63
	bcc  *+3
	inx
EndCode1180:

; ***** r+W *****

	.byte	$72,$2b,$57,0
	.byte	EndCode1181-*-1
	clc
	adc  #$63
	pha
	txa
	adc  #$73
	tax
	pla
EndCode1181:

; ***** r+I *****

	.byte	$72,$2b,$49,0
	.byte	EndCode1182-*-1
	clc
	adc  $63
	pha
	txa
	adc  $83
	tax
	pla
EndCode1182:

; ***** r+L *****

	.byte	$72,$2b,$4c,0
	.byte	EndCode1183-*-1
	clc
	adc  $7363
	pha
	txa
	adc  $7383
	tax
	pla
EndCode1183:

; ***** r+S *****

	.byte	$72,$2b,$53,0
	.byte	EndCode1184-*-1
	clc
	adc  $63
	bcc  *+3
	inx
EndCode1184:

; ***** r+C *****

	.byte	$72,$2b,$43,0
	.byte	EndCode1185-*-1
	clc
	adc  $7363
	bcc  *+3
	inx
EndCode1185:

; ***** r=B *****

	.byte	$72,$3d,$42,0
	.byte	EndCode1186-*-1
	lda  #$63
	ldx  #$73
EndCode1186:

; ***** r=W *****

	.byte	$72,$3d,$57,0
	.byte	EndCode1187-*-1
	lda  #$63
	ldx  #$73
EndCode1187:

; ***** r=I *****

	.byte	$72,$3d,$49,0
	.byte	EndCode1188-*-1
	lda  $63
	ldx  $83
EndCode1188:

; ***** r=L *****

	.byte	$72,$3d,$4c,0
	.byte	EndCode1189-*-1
	lda  $7363
	ldx  $7383
EndCode1189:

; ***** r=S *****

	.byte	$72,$3d,$53,0
	.byte	EndCode1190-*-1
	lda  $63
	ldx  #0
EndCode1190:

; ***** r=C *****

	.byte	$72,$3d,$43,0
	.byte	EndCode1191-*-1
	lda  $7363
	ldx  #0
EndCode1191:

; ***** r=a *****

	.byte	$72,$3d,$61,0
	.byte	EndCode1192-*-1
	ldx  #0
EndCode1192:

; ***** r=y *****

	.byte	$72,$3d,$79,0
	.byte	EndCode1193-*-1
	tya
	ldx  #0
EndCode1193:

; ***** r=r *****

	.byte	$72,$3d,$72,0
	.byte	EndCode1194-*-1
EndCode1194:

; ***** r=? *****

	.byte	$72,$3d,$3f,0
	.byte	EndCode1195-*-1
	cmp #0
	bne *+4
	cpx #0
	.byte $93
	beq *
EndCode1195:

; ***** r+? *****

	.byte	$72,$2b,$3f,0
	.byte	EndCode1196-*-1
	cpx #0
	.byte $93
	bpl *
EndCode1196:

; ***** r-? *****

	.byte	$72,$2d,$3f,0
	.byte	EndCode1197-*-1
	cpx #0
	.byte $93
	bmi *
EndCode1197:

; ***** y=B *****

	.byte	$79,$3d,$42,0
	.byte	EndCode1198-*-1
	ldy  #$63
EndCode1198:

; ***** y=S *****

	.byte	$79,$3d,$53,0
	.byte	EndCode1199-*-1
	ldy  $63
EndCode1199:

; ***** y=C *****

	.byte	$79,$3d,$43,0
	.byte	EndCode1200-*-1
	ldy  $7363
EndCode1200:

; ***** y=a *****

	.byte	$79,$3d,$61,0
	.byte	EndCode1201-*-1
	tay
EndCode1201:

; ***** y=r *****

	.byte	$79,$3d,$72,0
	.byte	EndCode1202-*-1
	tay
EndCode1202:

; ***** y=y *****

	.byte	$79,$3d,$79,0
	.byte	EndCode1203-*-1
EndCode1203:

; ***** y=? *****

	.byte	$79,$3d,$3f,0
	.byte	EndCode1204-*-1
	cpy #0
	.byte $93
	beq *
EndCode1204:

; ***** y+? *****

	.byte	$79,$2b,$3f,0
	.byte	EndCode1205-*-1
	cpy #0
	.byte $93
	bpl *
EndCode1205:

; ***** y-? *****

	.byte	$79,$2d,$3f,0
	.byte	EndCode1206-*-1
	cpy #0
	.byte $93
	bmi *
EndCode1206:

; ***** -a *****

	.byte	$2d,$61,0
	.byte	EndCode1207-*-1
	eor  #$FF
	inc  a
EndCode1207:

; ***** -r *****

	.byte	$2d,$72,0
	.byte	EndCode1208-*-1
	pha
	txa
	eor  #$FF
	tax
	pla
	eor  #$FF
	inc  a
	bne  *+3
	inx
EndCode1208:

; ***** ^a *****

	.byte	$5e,$61,0
	.byte	EndCode1209-*-1
	eor  #$FF
EndCode1209:

; ***** ^r *****

	.byte	$5e,$72,0
	.byte	EndCode1210-*-1
	pha
	txa
	eor  #$FF
	tax
	pla
	eor  #$FF
EndCode1210:

; ***** if *****

	.byte	$69,$66,0
	.byte	EndCode1211-*-1
	.byte	$a3,$0b
EndCode1211:

; ***** B *****

	.byte	$42,0
	.byte	EndCode1212-*-1
	lda  #$63
	ldx  #$73
EndCode1212:

; ***** C *****

	.byte	$43,0
	.byte	EndCode1213-*-1
	lda  $7363
	ldx  #0
EndCode1213:

; ***** I *****

	.byte	$49,0
	.byte	EndCode1214-*-1
	lda  $63
	ldx  $83
EndCode1214:

; ***** L *****

	.byte	$4c,0
	.byte	EndCode1215-*-1
	lda  $7363
	ldx  $7383
EndCode1215:

; ***** S *****

	.byte	$53,0
	.byte	EndCode1216-*-1
	lda  $63
	ldx  #0
EndCode1216:

; ***** W *****

	.byte	$57,0
	.byte	EndCode1217-*-1
	lda  #$63
	ldx  #$73
EndCode1217:
	.byte	0
