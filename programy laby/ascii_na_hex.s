# zamiana kodu ascii na hex

SYSREAD = 3
SYSWRITE = 4
SYSOPEN = 5
STDIN = 0
STDOUT = 1
SYSEXIT32 = 1
EXIT_SUCCESS = 0

.section .data
msg: .ascii "Podaj znak\n"
msg_len = .-msg
threeBytes: .ascii "   "

.section .bss
.lcomm oneByte, 1

.section .text
.global _start
_start:

# wypisanie napisu: podaj znak
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $msg, %ecx
movl $msg_len, %edx
int $0x80

# wczytanie znaku z klawiatury
movl $SYSREAD, %eax
movl $STDIN, %ebx
movl $oneByte, %ecx
movl $1, %edx
int $0x80

# skopiowanie wczytanego znaku do rejestru al
movb oneByte(,%edi,1), %al

# wyodrebnienie 4 mlodszych bitow i zapisanie ich w rejestrze cl
movb 00001111, %bl
andb %bl, %cl

cmpb $10, %cl
# dodanie liczby odpowiadajacej znakowi 0 jesli %cl<10
jl dodaj_mlodsze_0
# dodanie liczby odpowiadajacej znakowi A jesli %cl>10
jge dodaj_mlodsze_A

dodaj_mlodsze_0:
movl $0, %edi
addb '0', %cl
movb %cl, threeBytes(,%edi,1)
jmp starsze_bity

dodaj_mlodsze_A:
movl $1, %edi
addb 'A', %cl
movb %cl, threeBytes(,%edi,1)
jmp starsze_bity

starsze_bity:
# wyodrebnienie 4 starszych bitow i zapisanie ich w rejestrze ch
movb 11110000, %bh
andb %bh, %ch

cmpb $10, %ch
# dodanie liczby odpowiadajacej znakowi 0 jesli %cl<10
jl dodaj_starsze_0
# dodanie liczby odpowiadajacej znakowi A jesli %cl>10
jge dodaj_starsze_A

dodaj_starsze_0:
movl $0, %edi
addb '0', %ch
movb %ch, threeBytes(,%edi,2)
jmp wypisz_wynik

dodaj_starsze_A:
movl $0, %edi
addb 'A', %ch
movb %ch, threeBytes(,%edi,2)
jmp wypisz_wynik

wypisz_wynik:
# wypisanie wartosci wczytanego znaku szesnastkowo
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $threeBytes, %ecx
movl $3, %edx
int $0x80

mov $SYSEXIT32, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80
