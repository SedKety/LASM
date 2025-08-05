.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

.data
maxNum dd 100

.code
start:
    invoke GetTickCount       ; returns milliseconds since boot in EAX
    xor edx, edx              ; clear EDX before DIV
    mov ecx, maxNum           ; move maxNum into ecx
    div ecx                   ; divide EDX:EAX by ECX, remainder in EDX

    ; EDX now has random number from 0 to maxNum-1
    ; For demo, just exit returning that number (in EAX)
    mov eax, edx

    invoke ExitProcess, eax

end start
