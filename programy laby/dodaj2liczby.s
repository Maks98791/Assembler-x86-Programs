# program dodawania dwoch liczb arg1 i arg2
# Wynik zwracany w %ebx jako kod powrotu
# kompilacja: as dodaj2liczby.s --32 -o dodaj2liczby.o -g
# wykonanie:  ./dodaj2liczby
# echo $?

.section .data
arg1: .long 3
arg2: .long 4

.section .text

.globl _start

_start:
movl arg1, %eax
movl arg2, %ebx
addl %eax, %ebx       # wynik jest w %ebx jako kod powrotu
movl $1, %eax
int $0x80

