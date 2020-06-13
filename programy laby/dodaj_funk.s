# program wywolujacy funkcje dodawania dwoch liczb
# Wynik zwracany jako kod powrotu
# kompilacja:
# as dodaj_funk.s --32 -g -o dodaj_funk.o
# ld dodaj_funk.o -m elf_i386 -o dodaj_funk

.section .data
msg: .ascii "Hello, type two numbers you want to add\n\0"
msg_len = .-msg
msg_wynik: .ascii "Wynik: %d"
.section .bss
.lcomm arg1, 4
.lcomm arg2, 4

.section .text
.globl main
main:
pushl $msg
pushl $arg1
pushl $arg2
call printf
call scanf

# Wyrownaj stos
addl $8, %esp
addl $msg_len, %esp

pushl $arg1
pushl $arg2
call dodaj_func # call the function

# Wyrownaj stos
addl $8, %esp

# Wywolaj zakonczenie procesu
movl  %eax, %ebx # Suma w %ebx -kod powrotu
pushl %ebx
pushl msg_wynik
call printf

movl  $1, %eax # exit (%ebx is returned)
int   $0x80

# funkcja int dodaj(int a, int b) -------------------------------
.type dodaj_func, @function
dodaj:
pushl %ebp # save old base pointer
movl  %esp, %ebp # make stack pointer the base pointer
movl  8(%ebp), %eax # put first argument in %eax
movl  12(%ebp), %ecx # put second argument in %ecx
addl  %ecx, %eax # dodaj zawartosc %ecx do %eax
# wynik w %eax
movl %ebp,%esp # restore the stack pointer
popl %ebp # restore the base pointer
ret

.type exit_func, @function
exit_func:
pushl %ebp # zachowaj stary base pointer
movl %esp, %ebp # skopiuj wskaznik stosu do base pointer
movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
movl %ebp, %esp   # odtwarzamy stary stos
popl %ebp# odtwarzamy stary %ebp
ret
