# znajdowanie minimum w tablicy
# rejestr %edi - indeks tablicy
# rejestr %ebx - aktualna suma
# rejestr %eax - biezacy element

.section .data
tablica:.long 4,21,11,22,33,13,16,3,22,0
.section .text

.global _start

_start:
movl $0, %edi
movl tablica(,%edi,4), %eax
movl %eax, %ebx /*suma na razie to pierwszy element*/

start_loop:
cmpl $0, %eax /*sprawdzenie czy koniec tablicy*/
jle loop_exit /*jesli warunek spelniony to koniec petli*/
/*tu sie zaczyna kod petli*/
incl %edi
movl tablica(,%edi,4), %eax
addl %eax, %ebx
jmp start_loop /*powtorzenie petli*/
loop_exit:

/*wynik przekazywany jako kod powrotu (jesli jest mniejszy niz 255)*/
movl $1, %eax
int $0x80
