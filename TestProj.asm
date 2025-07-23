.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    message db "Hello world!", 13, 10, 0
    inputBuffer db 128 dup(0)  


.code

main:
    invoke StdOut, addr message
    invoke StdIn, addr inputBuffer, 128  
    invoke StdOut, addr inputBuffer
    invoke StdIn, addr inputBuffer, 128  
    invoke ExitProcess, 0
end main

