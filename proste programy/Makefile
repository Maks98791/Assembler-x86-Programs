all: hello tekst64

hello: hello.o
	ld hello.o -o hello

hello.o: hello.s
	as hello.s -o hello.o

tekst64: tekst64.o
	ld tekst64.o -o tekst64

tekst64.o: tekst64.s
	as tekst64.s -o tekst64.o

# make clean - usuwa hello.o i hello oraz tekst64.o i tekst64
clean:
	rm hello.o hello tekst64.o tekst64



# program tekst mozna szybciej odpalic tak: echo JAKISTEKST | ./tekst64
