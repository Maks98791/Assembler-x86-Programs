# sumowanie elementow dwoch tablica
# rejestr %edi - indeks tablicy
# rejestr %ebx - aktualna suma elementow
# rejestr %eax - biezaca liczba

.section .data
tablica1: .long 4,21,11,22,33,13,16,3,6,16,27,0
tablica2: .long 1,2,3,4,5,6,7,4,0

.section .text

.global _start

_start:
/*zsumowanie elementow pierwszej tablicy*/
movl $0, %edi
movl tablica1(,%edi,4), %eax
movl %eax, %ebx /*suma na razie to pierwszy element*/

start_loop:
cmpl $0, %eax /*sprawdzenie czy koniec tablicy*/
jle loop_exit /*jesli warunek spelniony to koniec petli*/
/*tu sie zaczyna kod petli*/
incl %edi
movl tablica1(,%edi,4), %eax
addl %eax, %ebx
jmp start_loop /*powtorzenie petli*/

loop_exit:
/*zsumowanie elementow drugiej tablicy z sumą elementów pierwszej tablicy*/
movl $0, %edi
movl tablica2(,%edi,4), %eax
addl %eax, %ebx /*suma na razie to pierwszy element*/

start_loop2:
cmpl $0, %eax /*sprawdzenie czy koniec tablicy*/
jle loop_exit2 /*jesli warunek spelniony to koniec petli*/
/*tu sie zaczyna kod petli*/
incl %edi
movl tablica2(,%edi,4), %eax
addl %eax, %ebx
jmp start_loop2 /*powtorzenie petli*/

/*suma jest w %ebx jako kod powrotu (jesli mniejsza niz 255)*/
loop_exit2:
movl $1, %eax
int $0x80
