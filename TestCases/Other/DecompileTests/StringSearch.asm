

 ; Simple program to learn about finding secret strings and such.
 ; The program intakes a string then compares it to the "correct one", then outputs one of 2 strings according to the comparison's return

.386

include \masm32\include\masm32rt.inc

.data 

keyStr db "SecretKey"
keyLngth equ $ - keyStr

inputBuffer db 256 dup(0)

initQuestion db "What is the secret key? Take a guess", 13, 10, 0

correctGuessStr db "Woo, you did it. nice one bud", 13, 10, 0
incorrectGuessStr db "Tough, didnt get it.", 13, 10, 0

.code

main:
   invoke StdOut, addr initQuestion
   
   ; Reset all registers
   mov al, 0 ; Inputbuffer's element
   mov ah, 0 ; Key's element
   mov esi, 0 ; Loop counter

   invoke StdIn, addr inputBuffer, 256
   jmp compare_string


compare_string:

   cmp esi, keyLngth

   jz correct_guess ; If we have reached the end of the loop we can conclude the strings allign. otherwise a return would've been called prior

   mov al, [inputBuffer + esi] 
   mov ah, [keyStr + esi]
   cmp al, ah 

   jnz incorrect_guess ; If the current elements are not equal the strings are not, thus we return

   inc esi ; Increment the current's loop's counter
   jmp compare_string ; Continue the loop

correct_guess:
   invoke StdOut, addr correctGuessStr
   invoke StdIn, addr inputBuffer, 256 ; To not immediately close the program
   invoke ExitProcess, 0
   
incorrect_guess:
   invoke StdOut, addr incorrectGuessStr
   invoke StdIn, addr inputBuffer, 256 ; To not immediately close the program
   invoke ExitProcess, 0




end main

