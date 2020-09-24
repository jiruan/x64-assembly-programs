global _start

        segment     .data
a       db          1
b       dw          2
c       dd          3
d       dq          4

        segment     .bss
e       resq        1

        segment     .text
_start:
    movzx rax, BYTE [a]
    movzx rbx, WORD [b]   
    mov ecx, DWORD [c]
    mov rdx, QWORD [d]

    add rcx, rdx
    add rbx, rcx
    add rax, rbx

    mov QWORD [e], rax

    mov rax, 60
    mov rsi, 0
    syscall
