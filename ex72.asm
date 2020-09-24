global _start 

        segment .data
a       dq      0x100
b       dq      0x111

        segment .text

; xor swaps quadwords in memory
; rdi -> a
; rsi -> b
xorswap:
    mov rax, [rdi]
    mov rdx, [rsi]

    xor rax, rdx
    xor rdx, rax
    xor rax, rdx

    mov [rdi], rax
    mov [rsi], rdx

    ret

_start:
    mov rdi, a
    mov rsi, b
    call xorswap

    mov rax, 60
    mov rdi, 0
    syscall

