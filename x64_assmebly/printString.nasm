section .data
    text db 'hello', 0
    text2 db 'hello World', 0

section .text
    global _start


_start:
    mov rax, text2
    call _print
    
    mov rax, 60
    mov rdi, 0
    syscall

_print:
   push rax
   mov rbx, 0
   _printLoop:
        inc rbx
        inc rax
        mov cl, [rax]
        cmp cl, 0
        jne _printLoop
    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
    ret