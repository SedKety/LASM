.386
.model flat, stdcall
option casemap :none

include \masm32\include\masm32rt.inc


; All variables are defined in here.
.data

    question db "What is 10 + 2?", 13, 10, 0 ; The question the user will be asked
    response db "Nah, incorrect, the answer is NOT: ", 0 ; The response to the user's input(For now)
    final db "You can now stop the process by inputting any character or ", 0 ; The final message sent signifying the end of the program

    crlf db 13, 10, 0 
    ; 13 = Carriage Return, Back to the start of the line
    ; 10 = Line Feed, Skip to the next line
    ; 0 = String terminator, end the string here. DONT FORGET THIS ONE lols

    inputBuffer db 128 dup(0)  ; The variable in which the user's input will be stored, allocates 128 bytes all written as (0)
    exampleInt db 10

    buttonTitle db "TestBox"
    buttonCaption db "This is a test :D"
.code

; The entry point of the program, like Int main in c, c++, c#
main:

    invoke MessageBoxA, NULL, addr buttonTitle, addr buttonCaption, MB_OK

    ; Ask the question
    invoke StdOut, addr question

    ; Get the input from the user
    invoke StdIn, addr inputBuffer, 128  
    
    ; Give the response to the user, now a straight forward text.
    ; No checking whether or not the inputted amount is equal to or not 12(The answer to the afforementioned question)
    invoke StdOut, addr response

    ; Prints the user's input
    invoke StdOut, addr inputBuffer

    ; Shove funny numbers into StdOut to make it aight for the next StdOut
    invoke StdOut, addr crlf

    ; Repeat so the process doesnt stop 
    invoke StdIn, addr inputBuffer, 128  
    
    ; After second input is given the process will stop
    invoke ExitProcess, 1
end main