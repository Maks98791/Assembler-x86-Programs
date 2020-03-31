SYSEXIT32 = 1
SYSCALL32 = 0x80
EXIT_SUCCESS = 0
SYSWRITE = 4
STDOUT = 1

.global _start

.data
message: .ascii "Hello World!\n"
message_length = . - message

.text

_start:
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $message, %ecx
mov $message_length, %edx
int $SYSCALL32

mov $SYSEXIT32, %eax
mov $EXIT_SUCCESS, %ebx
int $SYSCALL32
