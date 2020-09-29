global _start

        segment .data
a       dd      1, 3, 5
b       dd      2, 4, 6

        segment .bss
c       resd    1

        segment .text
;rsi -> ptr to array1
;rdi -> ptr to array2
;rdx -> array length
dotproduct:
            shl rdx, 1
            mov rcx, rdx
            xor r9, r9

.dotloop:   test rcx, rcx
            jz .enddot
            lodsd   ;load from array1
            mov r8, rax
    
            xchg rsi, rdi ;load from array2
            dec rcx
            lodsd

            imul r8 ;do the multiplication and addition
            add r9, rax
            jmp .dotloop

.enddot:    mov rax, r9
            ret

_start:
    lea rsi, [a]
    lea rdi, [b]
    mov rdx, 3

    call dotproduct

    mov [c], rax

    mov rdi, rax
    mov rax, 60
    syscall
