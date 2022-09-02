# ***********************************************************************************
#
#										Common Build 
#
# ***********************************************************************************
#
#	NB: Windows SDL2 is hard coded.
#
ifeq ($(OS),Windows_NT)
CCOPY = copy
CMAKE = make
CDEL = del /Q
CDELQ = >NUL
APPSTEM = .exe
S = \\
CXXFLAGS = -I . -fno-stack-protector -w -Wl,-subsystem,windows 
LDFLAGS = -lmingw32 
SDL_LDFLAGS =
OSNAME = windows
EXTRAFILES = 
else
CCOPY = cp
CDEL = rm -f
CDELQ = 
CMAKE = make
APPSTEM =
S = /
CXXFLAGS = -O2 -DLINUX  -fmax-errors=5 -I.  
LDFLAGS = 
OSNAME = linux
EXTRAFILES = 
endif
#
#		Root directory
#
ROOTDIR = ..$(S)
#
#		Script to run emulator, expecting parameter to follow
#
EMULATOR = $(ROOTDIR)bin$(S)jr256$(APPSTEM)
#
#		Current assembler
# 
ASM = 64tass
