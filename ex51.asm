global _start

        segment     .data
a       dd          0x1
b       dd          2
c       dd          3
d       dd          4

        segment     .text
_start:
    mov eax, dword [a]
    mov ebx, DWORD [b]
    mov ecx, DWORD [c]
    mov edx, DWORD [d]
    add rcx, rdx
    add rbx, rcx
    add rax, rbx

    mov rax, 60
    mov rsi, 0
    syscall
