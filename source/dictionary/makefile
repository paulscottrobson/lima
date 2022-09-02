ifeq ($(OS),Windows_NT)
include ..\documents\common.make
else
include ../documents/common.make
endif

all: 
	python buildinfo.py
	python errorgen.py en
	make -C tokens
	make -C fp
	make -C keyboard
	make -C assembler
	make -C documents

review:
	python checkreview.py