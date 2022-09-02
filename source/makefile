ifeq ($(OS),Windows_NT)
include ..\documents\common.make
else
include ../documents/common.make
endif

INCLUDES = -I include
CC = g++

.PHONY: all 

all: 

testdict$(APPSTEM) : dictionary.c
	$(CC) $(CXXFLAGS) $(INCLUDES) -D RUNALONE $< $(LDFLAGS) -o $@

%.o:%.cpp
	$(CC) $(CXXFLAGS) $(INCLUDES)  -c -o $@ $<


$(APPNAME): $(SOURCES)
	$(CC) $(SOURCES) $(LDFLAGS) $(SDL_LDFLAGS) -o $@
	