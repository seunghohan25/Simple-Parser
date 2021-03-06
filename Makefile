src = hpsmallc
objfiles = $(src).tab.o lex.yy.o

a.out : $(objfiles)
	cc $(objfiles) -o result

$(src).tab.c : $(src).y
	bison -d -v --graph --verbose $(src).y

lex.yy.c : $(src).l
	flex $(src).l

$(src).tab.o : $(src).tab.c
	cc -Wall -c $(src).tab.c

lex.yy.o : lex.yy.c
	cc -Wall -c lex.yy.c

clean :
	rm -rf result ./$(src).tab.c ./$(src).tab.h ./lex.yy.c ./$(objfiles) ./$(src).vcg ./$(src).output
