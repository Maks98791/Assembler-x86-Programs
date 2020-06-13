SYSEXIT  = 1
EXIT_SUCCESS = 0

.data
msg: .ascii "Wprowadz napis: "
msg_len = . -msg
msg_echo: .ascii "                            "
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
