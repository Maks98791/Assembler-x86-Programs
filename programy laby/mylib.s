
SYSEXIT  = 1
SYSREAD  = 3
SYSWRITE = 4
SYSOPEN  = 5
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0

.text

.globl read_func
.type read_func, @function
read_func:
pushl %ebp # zachowaj stary base pointer
movl %esp, %ebp # skopiuj wskaznik stosu do base pointer
movl $SYSREAD, %eax
movl $STDIN, %ebx
movl 8(%ebp), %ecx
movl 12(%ebp), %edx
movl %ebp, %esp   # odtwarzamy stary stos
popl %ebp# odtwarzamy stary %ebp
ret

.globl write_func
.type write_func, @function
write_func:
pushl %ebp # zachowaj stary base pointer
movl %esp, %ebp # skopiuj wskaznik stosu do base pointer
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl 8(%ebp), %ecx
movl 12(%ebp), %edx
movl %ebp, %esp   # odtwarzamy stary stos
popl %ebp# odtwarzamy stary %ebp
ret

.globl exit_func
.type exit_func, @function
exit_func:
pushl %ebp # zachowaj stary base pointer
movl %esp, %ebp # skopiuj wskaznik stosu do base pointer
movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
movl %ebp, %esp   # odtwarzamy stary stos
popl %ebp# odtwarzamy stary %ebp
ret
