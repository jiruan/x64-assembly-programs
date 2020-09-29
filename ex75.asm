global _start

        segment .data
a       dd      -18.0
b       dd      9.5

        segment .bss
imma    resq    1
immb    resq    1
sign    resq    1
exp     resq    1
expoff  resq    1
mant    resq    1

c       resd    1

        segment .text

;rdi -> a
;rsi -> b
multdouble:
    mov [imma], rdi
    mov [immb], rsi

    mov rdx, 0x80000000 ;get and calculate signs
    and rdi, rdx
    and rsi, rdx
    xor rdi, rsi
    mov [sign], rdi

    mov rax, [imma]
    mov rsi, [immb]

    mov rcx, 0x007FFFFF ;get and calculate mantissa
    mov rdi, 0x00800000
    mov r8, 1
    mov r9, 0x3FFFFF800000
    and rax, rcx
    and rsi, rcx
    or rax, rdi
    or rsi, rdi
    mov rcx, 0
    mul rsi

    bt rax, 47 ;normalization
    cmovc rcx, r8
    cmovc rdx, rdi
    shr rax, cl
    mov [expoff], rdx
    
    mov cl, 23 ;truncation
    and rax, r9
    shr rax, cl
    mov [mant], rax

    mov rdi, [imma]
    mov rsi, [immb]

    mov rdx, 0x7F800000 ;get and calculate exponents
    mov rcx, 0x3F800000
    and rdi, rdx
    and rsi, rdx
    add rdi, rsi
    add rdi, [expoff]
    sub rdi, rcx
    mov [exp], rdi

    mov rax, [sign] ;assemble
    or rax, [exp]
    or rax, [mant]

    ret

_start:
    mov eax, DWORD [a]
    mov ecx, DWORD [b]
    mov rdi, rax
    mov rsi, rcx

    call multdouble

    mov [c], eax

    mov rdi, rax
    mov rax, 60
    syscall
    
