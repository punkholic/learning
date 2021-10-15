section .data
    character db 0
    value db 10

section .text
    global _start

_start:
    call _printNewLine

_printStar:
    je _printNewLine
    mov rax, 42
    call _printRAXDigit
    dec r10b
    cmp r10b, 0
    jne _printStar
    je _printNewLine
    
_end:
    mov rax, 60
    mov rdi, 0
    syscall
    ret 

_printNewLine:
    mov rax, 10
    call _printRAXDigit
    inc r12b
    cmp r12b, [value]
    je _end
    mov r10b, r12b
    jne _printStar

_printRAXDigit:
    mov [character], al
    mov rax, 1
    mov rdi, 1
    mov rsi, character
    mov rdx, 1
    syscall
    ret
