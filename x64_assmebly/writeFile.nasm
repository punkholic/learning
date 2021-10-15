section .data
    filename db 'testFile',0
    textData db 'This will be written', 10


section .text
    global _start

_start:
    mov rax, 2
    mov rdi, filename
    mov rsi, 64+1
    mov rdx, 0644o
    syscall

    push rax
    mov rdi, rax 
    mov rax, 0
    mov rsi, textData
    mov rdx, 21
    syscall

    mov rdx, 3
    pop rdi 
    syscall

    mov rax, 60
    mov rsi, 0
    syscall