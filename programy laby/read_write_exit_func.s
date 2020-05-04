SYSEXIT  = 1
SYSREAD  = 3
SYSWRITE = 4
SYSOPEN  = 5
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0

.data
msg: .ascii "Wprowadz napis: "
msg_len = . -msg
msg_echo: .ascii "                                           "
msg_echo_len = . -msg_echo

.text
.global _start
_start:

# piszemy msg (Wprowadz napis: )
pushl $msg_len # push second argument
pushl $msg # push first argument
call write_func
addl $8, %esp
int $0x80# wywołanie przerwania programowego -# wykonanie funcji systemowej

# czytamy string do msg_echo
pushl $msg_echo_len # push second argument
pushl $msg_echo # push first argument
call read_func
addl $8, %esp
int $0x80

pushl $msg_echo_len # push second argument
pushl $msg_echo # push first argument
call write_func
addl $8, %esp
int $0x80

call exit_func
int $0x80

# ----------------------------- FUNKCJE -------------------------------------

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

.type exit_func, @function
exit_func:
pushl %ebp # zachowaj stary base pointer
movl %esp, %ebp # skopiuj wskaznik stosu do base pointer
movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
movl %ebp, %esp   # odtwarzamy stary stos
popl %ebp# odtwarzamy stary %ebp
ret
