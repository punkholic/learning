section .data
    newLine db 10, 0

section .bss
    argc resb 8
	argv resb 8

section .text
	global _start

%macro print 1
	mov rax, %1
	push rax
	mov rbx, 0
	_countLoop:
		inc rbx
		inc rax
		mov cl, [rax]
		cmp cl, 0
		jne _countLoop
	
	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall
%endmacro
%macro printNewLine 0
	mov rax, 1
	mov rdi, 1
	mov rsi, newLine
	mov rdx, 1
	syscall
%endmacro
_start:
	pop rax
	mov [argc], rax
	mov r10, 0

_printArgsLoops:
	inc r10
	pop rax
	print rax
	printNewLine
	cmp r10, [argc]
	jne _printArgsLoops

    mov rax, 60
    mov rdi, 0
    syscall
    
