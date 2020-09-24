global _start

        segment .data
cpkwh   dq      5
kwh     dq      1100

        segment .bss
pennies resq    1
dollars resq    1

        segment .text
_start:
    mov rax, QWORD [kwh]
    mov rdx, 0
    mov rcx, 100
    mov rbx, QWORD [cpkwh]

    sub rax, 1000 ;num hours over 1000
    cmovl rax, rdx
    imul rax, rbx
    add rax, 500
    mov [pennies], rax

    idiv rcx
    mov [dollars], rax

    mov rdi, rax
    mov rax, 60
    syscall
