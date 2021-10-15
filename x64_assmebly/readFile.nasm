section .data
    filename db 'testFile',0
    textData db 'This will be written', 10

section .bss
    something resb 100

section .text
    global _start

_start:
    mov rax, 2
    mov rdi, filename
    mov rsi, 0
    mov rdx, 0644o
    syscall

    push rax
    mov rdi, rax 
    mov rax, 0
    mov rsi, something
    mov rdx, 21
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, something
    mov rdx, 21
    syscall

    mov rdx, 3
    pop rdi 
    syscall

    mov rax, 60
    mov rsi, 0
    syscall