global _start

        segment .data
a       dq      0x7FF7FFFFFFFFFFFF

        segment .bss
sign    resq    1
exp     resq    1
digit   resq    1

        segment .text

;rdi -> double value
;rsi -> location of sign
;rdx -> location of exponent
;rcx -> location of digits
dissectdouble:
    mov r9, rdi
    mov r8,rdi
    mov r10, rdi

    mov rax, 0x7FF0000000000000 ;get exponent
    and r9, rax
    mov rax, 0x8000000000000000 ;get sign
    and r8, rax
    mov rax, 0x000FFFFFFFFFFFFF ;get significant
    and r10, rax 

    shr r9, 52
    shr r8, 63
    sub r9, 1023
    mov rax, 0x0010000000000000
    or r8, rax

    mov [rsi], r8
    mov [rcx], r10
    mov [rdx], r9

    ret

_start:
    mov rdi, QWORD [a]
    mov rsi, sign
    mov rdx, exp
    mov rcx, digit

    call dissectdouble

    mov r12, QWORD [sign]
    mov r13, QWORD [exp]
    mov rdi, QWORD [digit]

    add r13, 1023

    mov rax, 0x000FFFFFFFFFFFFF
    and rdi, rax
    shl r12, 63
    shl r13, 52
    or rdi, r12
    or rdi, r13

    mov rax, 60
    syscall

