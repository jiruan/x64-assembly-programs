; Program: exit
;
; Executes the exit system call
; no input
; output: exit status

global main

segment .text


main:
    mov eax, 1
    mov ebx, 5
    int 0x80

