ifeq ($(OS),Windows_NT)
include ..\documents\common.make
else
include ../documents/common.make
endif

DEMO = demo.lima

LIMA = ..$(S)bin$(S)lima
EMULATOR = ..$(S)bin$(S)jr256$(APPSTEM)
FNXMGR = ..$(S)bin$(S)fnxmgr.zip
LIMAOPTIONS = -l -c8000 -z20 -v600
PORT=/dev/ttyUSB0

MONITORREPO = ..$(S)..$(S)junior-tinykernel
EMULATORREPO = ..$(S)..$(S)junior-emulator
UTILSREPO = ..$(S)..$(S)junior-utilities

all : compile

compile:
	$(LIMA) $(LIMAOPTIONS) demo.lima 

run: compile
	..$(S)bin$(S)jr256$(APPSTEM) ..$(S)bin$(S)monitor.rom@F000 l.out@8000 

dasm:
	..$(S)bin$(S)dcc6502$(APPSTEM) -d -o 32768 l.out

tools: emulator utils lima monitor

lima:	
	make -B -C ..$(S)source

monitor:
	make -B -C $(MONITORREPO)
	$(CCOPY) $(MONITORREPO)$(S)monitor.rom ..$(S)bin 

emulator:
	make -B -C $(EMULATORREPO)
	$(CCOPY) $(EMULATORREPO)$(S)jr256* ..$(S)bin

utils:	
	make -B -C $(UTILSREPO)
	$(CCOPY) $(UTILSREPO)$(S)foenixmgr.ini .
	$(CCOPY) $(UTILSREPO)$(S)fnxmgr.zip ..$(S)bin

gomonitor:
	python fnxmgr.zip --port $(PORT) --binary ..$(S)junior-tinykernel$(S)monitor.rom --address F000

go:	compile
	python ..$(S)bin$(S)fnxmgr.zip --port $(PORT) --binary ..$(S)bin$(S)monitor.rom --address F000
	python ..$(S)bin$(S)fnxmgr.zip --port $(PORT) --binary l.out --address 8000

basic:	
	python ..$(S)bin$(S)fnxmgr.zip --port $(PORT) --binary ..$(S)bin$(S)basic02.bin --address 8000

ago:	
	64tass -q -c testcode/sprites.asm -o l.out
	python ..$(S)bin$(S)fnxmgr.zip --port $(PORT) --binary ..$(S)bin$(S)monitor.rom --address F000
	python ..$(S)bin$(S)fnxmgr.zip --port $(PORT) --binary l.out --address 8000