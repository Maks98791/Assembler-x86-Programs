SYSEXIT64 = 60
SYSREAD = 0;
SYSWRITE = 1
STDIN = 0
STDOUT = 1

input_len = 80

.global _start

# lepiej puste bufory inicjalizowac w sekcji bss zamiast data bo zajmuja mniej miejsca
# .data
.bss
input: .space input_len

.text

_start:
mov $SYSREAD, %rax
mov $STDIN, %rdi
mov $input, %rsi
mov $input_len, %rdx
syscall

mov %rax, %r8
dec %r8
# xor robi to samo co ten mov (oba wpisuja 0)
# mov $0, %r9
xor %r9, %r9

petla:
addb $0x20, input(%r9)
inc %r9
cmp %r8, %r9
jl petla

mov %rax, %rdx
mov $SYSWRITE, %rax
mov $STDOUT, %rdi
mov $input, %rsi
syscall

mov $SYSEXIT64, %rax
mov $0, %rdi
syscall
