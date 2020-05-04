# szyfr cezara z kluczem 1

SYSREAD = 3
SYSWRITE = 4
SYSOPEN = 5
STDIN = 0
STDOUT = 1
SYSEXIT32 = 1
SYSCALL32 = 0x80
EXIT_SUCCESS = 0

.data
msg: .ascii "Podaj tekst:\n"
msg_len = .-msg
bufor: .ascii "                                  "
bufor_len = .-bufor

.text
.global _start
_start:

# wypisanie napisu: podaj tekst
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $msg, %ecx
movl $msg_len, %edx
int $0x80

# wczytanie napisu z klawiatury
movl $SYSREAD, %eax
movl $STDIN, %ebx
movl $bufor, %ecx
movl $bufor_len, %edx
int $0x80

# petla po wszystkich wczytanych znakach
start_loop:
movb bufor(,%edi,1), %ah
# kod znaku mniejszy niz a
cmpb $97, %ah
jl bledna
# kod znaku wiekszy niz z
cmpb $122, %ah
jg bledna
# kod znaku rowny z
cmpb $122, %ah
je rowny_z

# zaszyfrowanie aktualnej litery
addb $1, %ah
movb %ah, bufor(,%edi,1)
incl %edi
cmpl $bufor_len, %edi
jle start_loop

rowny_z:
movb $97, %ah
movb %ah, bufor(,%edi,1)
incl %edi
cmpl $bufor_len, %edi
jle start_loop

bledna:
incl %edi
# warunek zakonczenia calej petli
cmpl $bufor_len, %edi
jle start_loop

# wypisanie zaszyfrowanego napisu
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $bufor, %ecx
movl $bufor_len, %edx
int $0x80

mov $SYSEXIT32, %eax
mov $EXIT_SUCCESS, %ebx
int $SYSCALL32
