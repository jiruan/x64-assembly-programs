global _start

        segment .bss
ARR     resq    128

        segment .text

;rdi -> arr ptr
;rsi ->  arr size (must be atleast 2)
;must make sure that the first and second values are present (eg. 0, 1)
nfib:
    mov r8, rsi
    sub rdi, 2
    add rsi, 8
.it:
    cmp rdi, 0
    jle .end

    xchg r8, rsi

    lodsq
    mov rdx, rax
    
    xchg rsi, r8
    dec rdi
    lodsq
    
    add rax, rdx
    mov [rsi], rax

    jmp .it
.end:
    ret

       
_start:
    mov rax, ARR
    mov QWORD [rax], 0
    add rax, 8
    mov QWORD [rax], 1

    mov rsi, ARR
    mov rdi, 100

    call nfib

    mov rsi, ARR
    mov rdi, ARR
    mov rbx, 3
    add rdi, 16
    add rsi, 24
.lim:
    mov rax, [rsi]
    mov rdx, [rdi]

    cmp rax, rdx
    jle .end
    
    add rsi, 8
    add rdi, 8
    inc rbx

    jmp .lim
.end:    

    mov rdi, rbx
    mov rax, 60
    syscall
