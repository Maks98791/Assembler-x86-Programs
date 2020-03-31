# znajdowanie minimum w tablicy
# rejestr %edi - indeks tablicy
# rejestr %ebx - aktualnie najmniejszy element
# rejestr %eax - biezacy element

.section .data
tablica: .long 67,34,224,45,75,54,34,44,33,22,11,66,0

.section .text

.global _start

_start:
movl $0, %edi
movl tablica(,%edi,4), %eax
movl %eax, %ebx

start_loop:
cmpl $0, %eax /*sprawdzenie czy koniec tablicy*/
je loop_exit
incl %edi
movl tablica(,%edi,4), %eax
cmpl %eax, %ebx /*jesli mialoby byc maximum to cmpl %ebx, %eax*/
jle start_loop
movl %eax, %ebx /*minimum jest w %ebx*/
jmp start_loop

loop_exit:
movl $1, %eax
int $0x80
