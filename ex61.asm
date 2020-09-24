global dist
global _start

        segment     .data
x1      dq          12
y1      dq          7
x2      dq          16
y2      dq          10

        segment     .text

; dist(x1, y1, x2, y2)
; x1 -> rcx
; y1 -> rdx
; x2 -> rsi
; y2 -> rdi
dist:
    sub rsi, rcx    ;x2-x1 in rsi
    sub rdi, rdx    ;y2-y1 in rdi   
    imul rsi, rsi   ;(x2-x1)^2 in rsi
    imul rdi, rdi   ;(y2-y1)^2 in rdi
    add rdi, rsi    ;(x2-x1)^2 + (y2-y1)^2 in rdi

    mov rax, rdi
    ret

    ;turns out you don't need the square root...

    ;newton's method of square root
    ;x0 = 0x1 (arbitrary)
    mov r8, 0x1 ;holds xn
    mov r9, 2

    ;round 1
    mov rdx, 0 
    mov rax, rdi
    div r8     ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 2
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 3
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 4
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 5
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 6
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 7
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 8
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 9
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    mov r8, rax
    
    ;round 10 (final)
    mov rdx, 0
    mov rax, rdi
    div r8 ;a/xn
    mov rdx, 0
    add rax, r8 ;(xn + a / xn)
    div r9 ;(xn + a / xn) / 2
    
    ret

_start:
    mov rdi, [y2]
    mov rsi, [x2]
    mov rdx, [y1]
    mov rcx, [x1]

    call dist
 
    mov rdi, rax   
    mov rax, 60
    syscall
