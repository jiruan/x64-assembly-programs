global _start

        segment .data
g1      dq      100
g2      dq      50
g3      dq      100
g4      dq      50

        segment .bss
avg     resq    1
rem     resq    1

        segment .text
_start:
    mov rax, QWORD [g1]
    mov rbx, QWORD [g2]
    mov rcx, QWORD [g3]
    mov rsi, QWORD [g4]
    mov rdi, 4
    mov rdx, 0
    
    add rcx, rsi
    add rbx, rcx
    add rax, rbx
    div rdi

    mov [avg], rax
    mov [rem], rdx

    mov rdi, rax
    mov rax, 60
    syscall
