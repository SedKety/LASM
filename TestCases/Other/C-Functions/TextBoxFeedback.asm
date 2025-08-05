.386
option casemap :none

include \masm32\include\masm32rt.inc


; All variables/identifiers are defined in here.
.data
    ; Responses
    rightAnswer db "You are... correct! Congratulations, you are now a proffessional mathematician", 13, 10, 0; Carriage Return, Line Feed, String Terminator/NULL
    wrongAnswer db "You are... sadly not correct. Better luck next time buddy!", 13, 10, 0 ; Carriage Return, Line Feed, String Terminator/NULL

    ; Button identifiers
    buttonTitle db "Question", 0; String terminator/NULL
    buttonCaption db "Is 10 + 2 = 12", 0 ; String terminator/NULL

    ; Buffers
    inputBuffer db 16 dup(0) ; Make an inputbuffer. 16 bytes, all allocated as 0(Aka: NULL)

.code

; The entry point of the program, like int main in c, c++, c#
main:

    ;Create a simple messagebox(OwnerWindow, Caption, Title, BehaviorType)
    invoke MessageBoxA, NULL, addr buttonCaption, addr buttonTitle, MB_YESNO 


    ; The eax register will be set to 6 if the yes button is pressed
    cmp eax, 6
    je clicked_yes ; Jump to clicked_no if eax equals 7 (ZF in the EFLAGS register is set to 1 after cmp)

    ; The eax register will be set to 7 if the no button is pressed
    cmp eax, 7
    je clicked_no ; Jump to clicked_no if eax equals 7 (ZF in the EFLAGS register is set to 1 after cmp)

; Label that is called when the eax register is equal to 6(yes)
clicked_yes:
    invoke StdOut, addr rightAnswer
    jmp quit_program

; Label that is called when the eax register is equal to 7(no)
clicked_no:
    invoke StdOut, addr wrongAnswer
    jmp quit_program


; Finally, quit the program
quit_program:
    invoke StdIn, addr inputBuffer, 16
    end main