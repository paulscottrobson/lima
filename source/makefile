ifeq ($(OS),Windows_NT)
include ..\documents\common.make
else
include ../documents/common.make
endif

INCLUDES = -I include
CC = g++

.PHONY: all 

all: 

testsearch: testdict$(APPSTEM)
	./testdict$(APPSTEM) "S->R" "proc hello()" "R=522" "A=52" "A<4?" "R=311?" "R=544" "R=S32" "R=I322" "C32=R" "L532=R"

testdict$(APPSTEM) : dictionary.c
	make -C dictionary
	$(CC) $(CXXFLAGS) $(INCLUDES) -D RUNALONE $< $(LDFLAGS) -o $@

%.o:%.cpp
	$(CC) $(CXXFLAGS) $(INCLUDES)  -c -o $@ $<


$(APPNAME): $(SOURCES)
	$(CC) $(SOURCES) $(LDFLAGS) $(SDL_LDFLAGS) -o $@
	