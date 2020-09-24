; Program: exit
;
; Executes the exit system call
; no input
; output: exit status

segment .text
global _start

_start:
    mov eax, 1
    mov ebx, 5
    int 0x80

