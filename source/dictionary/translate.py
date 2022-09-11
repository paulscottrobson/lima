# ******************************************************************************
# ******************************************************************************
#
#		Name : 		translate.py
#		Purpose : 	Converts translations to Matches
#		Author : 	Paul Robson (paul@robsons.org.uk)
#		Created : 	2nd September 2022
#
# ******************************************************************************
# ******************************************************************************

import re,os,sys

# ******************************************************************************
#
#								Match class
#
# ******************************************************************************

class Match(object):
	def __init__(self,mType,match,code):
		self.mType = mType 
		self.match = match  
		self.code = code
		self.key = self.match.lower()
		if self.key.find("<const>") >= 0: 														# Replace <const> <var> <proc>
			assert self.mType == "B" or self.mType == "W"
			self.key = self.key.replace("<const>",self.mType)
		if self.key.find("<var>") >= 0: 							
			assert self.mType == "S" or self.mType == "L" or self.mType == "I" or self.mType == "C"
			self.key = self.key.replace("<var>",self.mType)
		if self.key.find("<proc>") >= 0: 							
			assert self.mType == "P"
			self.key = self.key.replace("<proc>",self.mType)
		Match.labelCount = 1000
	#
	def getKey(self):
		return self.key
	#
	def dump(self,h,executes):
		h.write("\n; ***** {0} *****\n\n".format(self.key))
		b = [ord(x) for x in self.key]
		b = ",".join(["${0:02x}".format(x) for x in b])
		h.write("\t.byte\t{0},0\n".format(b))
		h.write("\t.byte\tEndCode{0}-*-1\n".format(Match.labelCount))
		for c in [x.strip() for x in self.code.split(";") if x.strip() != ""]:
			code = self.translate(c,executes)
			code = code if code.endswith(":") else "\t"+code
			h.write("{0}\n".format(code))
		h.write("EndCode{0}:\n".format(Match.labelCount))
		Match.labelCount += 1
	#
	def translate(self,s,executes):
		isZeroAddr  = self.mType == "I" or self.mType == "S"
		#
		s = s.replace("<low>","${0:x}".format(Match.C_LOW))
		s = s.replace("<high>","${0:x}".format(Match.C_HIGH))
		#		
		a1 = Match.C_LOW if isZeroAddr else (Match.C_HIGH << 8)|Match.C_LOW
		s = s.replace("<addr>","${0:x}".format(a1))
		#		
		a1 = Match.C_LOWPLUS1 if isZeroAddr else (Match.C_HIGH << 8)|Match.C_LOWPLUS1
		s = s.replace("<next>","${0:x}".format(a1))
		#
		s = s.replace("[data]",".byte ${0:x}".format(Match.C_SETDATA))
		#
		m = re.match("^\\[exec\\:(.*)\\]$",s)
		if m is not None:
			s = ".byte\t${0:x},${1:02x}".format(Match.C_EXEC,executes[m.group(1).lower()])
		return s

Match.C_ISZERO = 	0x53
Match.C_LOW = 		0x63
Match.C_HIGH = 		0x73
Match.C_LOWPLUS1 = 	0x83
Match.C_SETDATA = 	0x93
Match.C_EXEC = 		0xA3

# ******************************************************************************
#
#							A collection of matches
#
# ******************************************************************************

class MatchBook(object):
	def __init__(self):
		self.matches = {} 												# match -> Match()				
		self.executes = {}
		self.execCount = 0
	#
	#		Load matches in.
	#
	def load(self,fileName):
		src = [x.replace("\t"," ").rstrip() for x in open(fileName).readlines()]				# preprocess tabs to spaces
		src = [x[:x.find("//")].rstrip() if x.find("//") >= 0 else x for x in src] 				# remove comments
		src = [x for x in src if x != ""]														# remove blanks.
		src = [";"+x.strip() if x.startswith(" ") else "|||"+x+";" for x in src] 				# prefix with : or |||	
		src = "".join(src).strip().split("|||") 												# split into units
		for s in [x for x in src if x != ""]: 													# work through all non blanks
			m = re.match("^([BWISP\\*]+)\\s*(.*?)\\;(.*)$",s)  									# split up
			assert m is not None,"Bad line "+s
			for g in m.group(1): 																# for each group
				code = self.checkExecute(m.group(3).strip())
				self.create(g,m.group(2).replace(" ",""),m.group(3))
				if g == "S":
					self.create("C",m.group(2).replace(" ",""),m.group(3))
				if g == "I":
					self.create("L",m.group(2).replace(" ",""),m.group(3))
	#
	#		Create one group match/
	#
	def create(self,group,match,code):
		rec = Match(group,match,code)	
		key = rec.getKey()
		#print(key,"//",group,"//",match,"//",code)
		assert key not in self.matches,"Duplicate "+key 
		self.matches[key] = rec
	#
	#		Check for executes, replace with ID
	#
	def checkExecute(self,s):
		if s.find("[exec:") >= 0:
			m = re.search("(\\[exec\\:.*?\\])",s)
			assert m.group(1) != "","Bad [exec]"+s
			execName = m.group(1).lower()[6:-1]
			if execName not in self.executes:
				self.execCount += 1
				self.executes[execName] = self.execCount
			s = s.replace(m.group(1),"[exec:"+str(self.executes[execName])+"]")
		return s 
	#
	#		Dump all matches.
	#
	def dumpMatches(self,h):
		keys = [x for x in self.matches.keys()]
		keys.sort(key = lambda x:-len(x)*1000+ord(x[0]))
		for k in keys:
			self.matches[k].dump(h,self.executes)
		h.write("\t.byte\t0\n")
	#
	#		Dump executes
	#
	def dumpExecutes(self,h):
		for k in self.executes.keys():
			h.write("#define EXEC_{0} ({1})\n".format(k.upper(),self.executes[k]))

m = MatchBook()
for root,dirs,files in os.walk("definitions"):
	for f in files:
		if f.endswith(".def"):
			m.load(root+os.sep+f)

h = open("generated/codesub.h","w")
h.write("//\n//\tThis code is automatically generated.\n//\n")
h.write("#define CODE_ISZERO (0x{0:02x})\n".format(Match.C_ISZERO))
h.write("#define CODE_LOW (0x{0:02x})\n".format(Match.C_LOW))
h.write("#define CODE_HIGH (0x{0:02x})\n".format(Match.C_HIGH))
h.write("#define CODE_LOWPLUS1 (0x{0:02x})\n".format(Match.C_LOWPLUS1))
h.write("#define CODE_SETDATA (0x{0:02x})\n".format(Match.C_SETDATA))
h.write("#define CODE_EXEC (0x{0:02x})\n".format(Match.C_EXEC))
h.write("\n")
m.dumpExecutes(h)
h.write("\n")
tests = [Match.C_ISZERO,Match.C_LOW,Match.C_HIGH,Match.C_LOWPLUS1,Match.C_SETDATA,Match.C_EXEC]
h.write("#define ISSUBST(c) ({0})\n".format(" || ".join(["(c) == 0x{0:02x}".format(c) for c in tests])))
h.close()

h = open("generated/dictionary.asm","w")
h.write(";\n;\tThis code is automatically generated.\n;\n")
h.write("\t* = $1000\n")
m.dumpMatches(h)
h.close()
