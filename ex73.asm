global _start

        segment .data
a       dq      0xFF7F7F7F7F7F7F7F

        segment .text
;rdi
bytexors:
    mov rdx, rdi
    xor rax, rax

    mov al, dl 
    xor al, dh

    ror rdx, 16
    xor al, dl
    xor al, dh      

    ror rdx, 16
    xor al, dl
    xor al, dh

    ror rdx, 16
    xor al, dl
    xor al, dh

    ret

_start:
    mov rdi, [a]
    call bytexors 

    mov rdi, rax
    mov rax, 60
    syscall
