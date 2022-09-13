all: 

PORT = /dev/ttyUSB0

all:testshim

run: code
	./jr256 xxx go

code:
	64tass -c -b -q -o basic.rom shim.asm
	64tass -c -b -q -o shim2.bin shim2.asm

basic:
	python ../bin/fnxmgr.zip --port $(PORT) --binary basic02.bin --address 8000

testshim:code
	python ../bin/fnxmgr.zip --port $(PORT) --binary basic.rom --address 8000

testshim2:code	
	python buildexec.py shim2.bin
	python ../bin/fnxmgr.zip --port $(PORT) --binary shim2.bin.load --address 8000
