ifeq ($(OS),Windows_NT)
include ..\..\documents\common.make
else
include ../../documents/common.make
endif

all: 
	python translate.py
	64tass -Wall -a -q -b -c generated$(S)dictionary.asm --output=generated$(S)dictionary.bin --list=generated$(S)dictionary.lst
	python convert.py