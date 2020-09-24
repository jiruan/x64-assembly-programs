global _start

        segment .data
x1      dq      12
y1      dq      7
x2      dq      16
y2      dq      10

        segment .bss
xdiff   resq    1
ydiff   resq    1

        segment .text
_start:
    mov rax, QWORD [x1]
    mov rbx, QWORD [x2]
    mov rcx, QWORD [y1]
    mov rdx, QWORD [y2]
    mov rdi, 1
    mov rsi, 0

    sub rbx, rax
    cmovz rax, rdi
    cmovnz rax, rsi

    sub rdx, rcx
    
    mov [xdiff], rbx
    mov [ydiff], rdx

    mov rax, 60
    mov rdi, 0
    syscall
