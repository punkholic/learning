%include 'macroTryFunctions.inc'
section .data
    character db 0,
    string db "Hello World",10 , 0
section .text
    global _start

_start:
    printString string
    print 1
    end
