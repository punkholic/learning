section .data

section .bss
    numberArray resb 100
    currentAddress resb 8

section .text
    global _start

_start:
    mov rax, 123
    call _printDigit
    
    mov rax, 60
    mov rdi, 1
    syscall

_printDigit:
    mov rbx, numberArray
    mov rcx, 10
    mov [rbx], rcx
    inc rbx
    mov [currentAddress], rbx

    _divideLoop:
        mov rdx, 0
        mov rbx, 10
        div rbx
        push rax
        add rdx, 48

        mov rbx, [currentAddress]
        mov [rbx], dl
        inc rbx
        mov [currentAddress], rbx

        pop rax
        cmp rax, 0
        jne _divideLoop
    
    _printLoop:
        mov rbx, [currentAddress]

        mov rax, 1
        mov rdi, 1
        mov rsi, rbx
        mov rdx, 1
        syscall
        
        dec rbx
        mov [currentAddress], rbx

        cmp rbx, numberArray
        jge _printLoop

    ret


