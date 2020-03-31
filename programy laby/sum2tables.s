# sumowanie elementow dwoch tablica
# rejestr %edi - indeks tablicy
# rejestr %ebx - aktualna suma elementow
# rejestr %eax - biezaca liczba

.section data
tablica1: .long 63,67,34,224,45,75,54,34,44,33,22,11,66,0
tablica2: .long 1,2,3,4,5,6,7,4,4,3,2,1,6,0

.section text

.global _start

_start:
movl $0, %edi
movl tablica1(,%edi,4), %eax
addl %eax, %ebx

start_loop:
cmpl $0, %eax /*sprawdzenie czy koniec tablicy*/
je loop_exit
incl %edi
movl tablica1(,%edi,4), %eax
addl %eax, %ebx
jmp start_loop

loop_exit:
movl $1, %eax
int $0x80
