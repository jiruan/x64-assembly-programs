global _start

        segment .text

; counts the number of bits in a byte
; byte -> rdi
countbit:
    mov rdx, 0
    mov rcx, 0
    mov rax, 0
 
    ;bit 1
    bt rdi, rdx
    setc cl
    add rax, rcx
    inc rdx
 
    ;bit 2
    bt rdi, rdx
    setc cl
    add rax, rcx
    inc rdx
 
    ;bit 3
    bt rdi, rdx
    setc cl
    add rax, rcx
    inc rdx
 
    ;bit 4
    bt rdi, rdx
    setc cl
    add rax, rcx
    inc rdx
 
    ;bit 5
    bt rdi, rdx
    setc cl
    add rax, rcx
    inc rdx

    ;bit 6
    bt rdi, rdx
    setc cl
    add rax, rcx
    inc rdx

    ;bit 7
    bt rdi, rdx
    setc cl
    add rax, rcx
    inc rdx

    ;bit 8
    bt rdi, rdx
    setc cl
    add rax, rcx
    inc rdx

    ret

_start:
    mov rdi, 0b10111001
    call countbit    

    mov rdi, rax
    mov rax, 60
    syscall
