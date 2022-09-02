# ******************************************************************************
# ******************************************************************************
#
#		Name : 		convert.py
#		Purpose : 	Converts binary to C constant array
#		Author : 	Paul Robson (paul@robsons.org.uk)
#		Created : 	2nd September 2022
#
# ******************************************************************************
# ******************************************************************************

b = [x for x in open("generated/dictionary.bin","rb").read(-1)]
s = ",".join(["0x{0:02x}".format(c) for c in b])
open("generated/dictionary.h","w").write(s+"\n")
