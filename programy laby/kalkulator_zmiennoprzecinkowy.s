.section .text

.globl suma
suma:
push %ebp
movl %esp, %ebp
fldl 8(%ebp)
fldl 16(%ebp)
faddp
mov %ebp, %esp
pop %ebp
ret

.globl roznica
roznica:
push %ebp
movl %esp, %ebp
fldl 8(%ebp)
fldl 16(%ebp)
fsubp
mov %ebp, %esp
pop %ebp
ret

.globl mnozenie
suma:
push %ebp
movl %esp, %ebp
fldl 8(%ebp)
fldl 16(%ebp)
fmulp
mov %ebp, %esp
pop %ebp
ret

.globl dzielenie
dzielenie:
push %ebp
movl %esp, %ebp
fldl 8(%ebp)
fldl 16(%ebp)
fdivp
mov %ebp, %esp
pop %ebp
ret

.globl pierwiastek
pierwiastek:
push %ebp
movl %esp, %ebp
fldl 8(%ebp)
fldl 16(%ebp)
fsqrt
mov %ebp, %esp
pop %ebp
ret

.globl sinus
sinus:
push %ebp
movl %esp, %ebp
fldl 8(%ebp)
fldl 16(%ebp)
fsin
mov %ebp, %esp
pop %ebp
ret