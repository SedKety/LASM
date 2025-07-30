.386
include \masm32\include\masm32rt.inc

.data ; The section to hold identifiers

   arrayToSort db 9, 1, 5, 6, 3
   arraySize equ $ - arrayToSort

.code ; The section that holds all the code

; ECX = outer_loop counter
; EDX = inner_loop counter

main:

   mov ecx, arraySize
   dec ecx ; Remove one from the ecx, this will be used to check whether or not we have completed the for loop


outer_loop:
   mov esi, 0 ; Pointer to the current iteration of the array
   mov edx, ecx
   cmp edx, 0
   jnz end_of_sorting


inner_loop:
   mov al, [arrayToSort + esi] ; A pointer to the current iterator's memory address + the offset of esi 
   mov bl, [arrayToSort + esi + 1] ; Pointer to the next iterator's memory address
   cmp al, bl
   jle no_swap ; If the next integer is smaller than this one, it calls the no_swap function 
   jge swap


no_swap: ; Called when the next number is bigger then the previous number
   inc esi ; Increase the current iteration of the array by 1
   dec edx ; Remove 1 from the arraySize checker, to see if we have reached the end of the array
   cmp edx, 0 ; Check if we have reached the end of the arrray
   jnz outer_loop ; If edx(the current iteration - arraysize) is not zero then we jump back to the outerLoop

   dec ecx ; Remove one from the current arraysize, because the largest number has already been pushed to the back
   jnz inner_loop 

swap: ; Called when the next number is smaller than the previous one 
   mov [arrayToSort + esi], bl 
   mov [arrayToSort + esi + 1], al


end_of_sorting:
   invoke ExitProcess, 0


end main