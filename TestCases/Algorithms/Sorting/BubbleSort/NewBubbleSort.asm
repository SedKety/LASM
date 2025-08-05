.386 ; The family tree my cpu is from

include \masm32\include\masm32rt.inc ; Include the masm library

.data ; The section that holds my identifiers
   myArray db 9, 5, 3, 7 ; The array that i wish to sort
   arrayLength equ $ - myArray ; The length of the array that i wish to sort

.code ; The section that holds my code

main:
   mov edx, 0  ; Outer loop counter – tracks how many passes have been completed
   mov ecx, 0  ; Inner loop index – used to compare and possibly swap adjacent elements

iterate_over_array:
   mov eax, arrayLength ; Move the length of the array into eax
   sub eax, edx ; Remove edx from eax
   sub eax, 2 ; Remove 2 from eax, this is needed because we check in pairs. 
   cmp ecx, eax ; Compare ecx(inner loop index), with eax, which in this case is the highest needed iteration(such as on iteration 2 we no longer need to check the final element of the array)
   jg next_sort

   mov al, [myArray + ecx] ; Move the current iteration of the array into al
   mov bl, [myArray + ecx + 1] ; Move the next value of the array into bl

   cmp al, bl ; Compare the current iteration with the next one
   jg swap_values ; If the next value is smaller than this one, swap

   inc ecx
   jmp iterate_over_array

swap_values: ; Swaps the values of the current/next items of the array
   mov [myArray + ecx], bl 
   mov [myArray + ecx + 1], al
   inc ecx
   jmp iterate_over_array

next_sort:
   cmp edx, arrayLength ; See if we have reached the end of the sort
   jge end_of_sorting ; If so, we end the program

   inc edx ; Decrement the amount of needed iterations within an array
   mov ecx, 0 ; Reset the amount of needed iterations within an array for the next sort
   jmp iterate_over_array ; Now that everything has been set right, we continue looping the array

end_of_sorting:
   invoke ExitProcess, 0

end main
