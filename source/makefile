ifeq ($(OS),Windows_NT)
include ..\documents\common.make
else
include ../documents/common.make
endif

INCLUDES = -I include
CC = g++

.PHONY: all 

all: 

testeval : eval_so$(APPSTEM)
	./eval_so$(APPSTEM)

testdict: dict_so$(APPSTEM)
	./dict_so$(APPSTEM) "S->R" "proc hello()" "R=522" "A=52" "A<4?" "R=311?" "R=544" "R=S32" "R=I322" "C32=R" "L532=R"

eval_so$(APPSTEM) : evaluate.c
	$(CC) $(CXXFLAGS) $(INCLUDES) -D RUNALONE $< $(LDFLAGS) -o $@

dict_so$(APPSTEM) : dictionary.c
	make -C dictionary
	$(CC) $(CXXFLAGS) $(INCLUDES) -D RUNALONE $< $(LDFLAGS) -o $@

%.o:%.cpp
	$(CC) $(CXXFLAGS) $(INCLUDES)  -c -o $@ $<

$(APPNAME): $(SOURCES)
	$(CC) $(SOURCES) $(LDFLAGS) $(SDL_LDFLAGS) -o $@
	