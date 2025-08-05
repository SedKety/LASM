.386

.data ; The section to hold identifiers

   arrayToSort db 9, 1, 5, 6, 3
   arraySize equ $ - arrayToSort

   noSwapString db "No need to swap, the number after this is higher then the previous one.", 0, 13, 10
   swapString db "Had to swap, the number after this is less then the previous one", 0, 13, 10

.code ; The section that holds all the code

main:

   mov ecx, arraySize
   dec ecx ; Remove one from the ecx, this will be used to check whether or not we have completed the for loop

outer_loop:
   mov esi, 0 ; Pointer to the current iteration of the array
   mov edx, ecx

inner_loop:
   mov al, [arrayToSort + esi] ; A pointer to the current iterator's memory address + the offset of esi 
   mov bl, [arrayToSort + esi + 1] ; Pointer to the next iterator's memory address
   cmp al, bl
   jle no_swap ; If the next integer is smaller than this one, it calls the no_swap function 
   jge swap


no_swap: ; Called when the next number is bigger then the previous number
   invoke StdOut, noSwapString
   inc esi ; Increase the current iteration of the array by 1
   dec edx ; Remove 1 from the arraySize checker, to see if we have reached the end of the array
   cmp edx, 0 ; Check if we have reached the end of the arrray
   jnz outer_loop ; If edx(the current iteration - arraysize) is not zero then we jump back to the outerLoop

   dec ecx ; Remove one from the current arraysize, because the largest number has already been pushed to the back
   jnz inner_loop 

   invoke ExitProcess, 0

swap: ; Called when the next number is smaller than the previous one 


   invoke StdOut, swapString
   mov [arrayToSort + esi], bl 
   mov [arrayToSort + esi + 1], al

end main