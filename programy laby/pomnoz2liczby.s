# program mnozacy dwie liczby
# wynik zwracany w %ebx jako kod powrotu

.data
arg1: .long 3
arg2: .long 4

.text

.globl _start

_start:
movl arg1, %eax
movl arg2, %ebx
imull %eax, %ebx
movl $1, %eax
int $0x80

