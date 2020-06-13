# Program pisze komunikat "hello world" i sie konczy
# kompilacja: gcc hello_lib.s -o hello_lib

.section .data
helloworld:
.ascii "hello world\n\0"

.section .text
.globl main
main:
# kopiujemy adres na stos
pushl $helloworld
# wywolanie printf
call printf
# wyrownanie stosu
addl $4, %esp
pushl $0
call exit
