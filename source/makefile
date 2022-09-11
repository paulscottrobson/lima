ifeq ($(OS),Windows_NT)
include ..\documents\common.make
else
include ../documents/common.make
endif

INCLUDES = -I include
CC = g++

.PHONY: all 

all: 

lima$(APPSTEM) : lima.o dictionary.o evaluate.o generate.o 
	$(CC) $(CXXFLAGS) $^ $(LDFLAGS) -o $@

testeval : eval_so$(APPSTEM)
	./eval_so$(APPSTEM)
	$(CDEL) eval_so$(APPSTEM)

testdict: dict_so$(APPSTEM)
	./dict_so$(APPSTEM) "S->R" "proc hello()" "R=522" "A=52" "A<4?" "R=311?" "R=544" "R=S32" "R=I322" "C32=R" "L532=R" "zbyte xx" "endproc"
	$(CDEL) dict_so$(APPSTEM) 

testgen : gen_so$(APPSTEM)
	./gen_so$(APPSTEM)
	$(CDEL) gen_so$(APPSTEM)

eval_so$(APPSTEM) : evaluate.c
	$(CC) $(CXXFLAGS) $(INCLUDES) -D E_RUNALONE $< $(LDFLAGS) -o $@

dict_so$(APPSTEM) : dictionary.c
	make -C dictionary
	$(CDEL) *.o*
	$(CC) $(CXXFLAGS) $(INCLUDES) -D D_RUNALONE $< $(LDFLAGS) -o $@

gen_so$(APPSTEM) : generate.c dictionary.o evaluate.o
	$(CC) $(CXXFLAGS) $(INCLUDES) -D G_RUNALONE $^ $(LDFLAGS) -o $@

%.o:%.c
	$(CC) $(CXXFLAGS) $(INCLUDES)  -c -o $@ $<

$(APPNAME): $(SOURCES)
	$(CC) $(SOURCES) $(INCLUDES) $(LDFLAGS) $(SDL_LDFLAGS) -o $@
	