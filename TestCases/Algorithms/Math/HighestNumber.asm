.386

include \masm32\include\masm32rt.inc

.data
    arrayToCheck db 4, 3, 9, 10, 2, 11, 5, 69, 3
    arraySize equ $ - arrayToCheck

    newMaxMsg db "New max found: ", 0
    notMaxMsg db "Not a new max: ", 0
    finalMaxMsg db "Highest number in array: ", 0
    highestNum db 0
.code

main:
   mov al, [arrayToCheck]
   mov curHighestNum, al
   mov esi, 0
   inc esi

array_check_loop:
   inc esi ; Increment which index we are currently at
   cmp esi, arraySize + 1 ; Compare the current index to the index's size + 1 to see if we are going to hit outerbounds
   jz done_checking ; If esi is out of bounds we exit the process

   mov al, curHighestNum
   cmp al, [arrayToCheck + esi] ; Compare the element at the current iteration of the array to the previously highest number
   
   jl set_highest_number ; If the current element is greater then the previous highest number it will become the new highest number

   jmp array_check_loop ; Go to the next iteration of the array

set_highest_number:
   mov al, [arrayToCheck + esi] ; Place the value of the current element in al
   jmp array_check_loop; Go to the next iteration of the array

done_checking:
   mov highestNum, al
   invoke ExitProcess, 0

end main