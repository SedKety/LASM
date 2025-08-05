.386 ; The family line my cpu is from

include \masm32\include\masm32rt.inc ; Include the masm library, done solely to make ending the process easier

.data 
myArray db 3, 100, 69, 32, 2, 1, 0, 15, 27 ; The array that will be sorted, this time using the selection sort algorithm, yippee
arrayLength equ $ - myArray ; The length of the array is = (last ptr, in this case myArray's 9 element, and myArray's pointer)
bufferArray db arrayLength dup(?) ; We will put the new array in this one. 

.code

; The selection sort algorithm is pretty straightforward:
; loop over the array. find the smallest number, insert that at the first position. repeat 

   mov esi, arrayLength ; The amount of needed checks every iteration
   mov edi, 0 ; The number of array iterations we have done

outer_loop: ; Remove the lowest number from the arraytocheck, check if we have ended the sort, and go to the next inner_loop

   mov al, [myArray] ; we will store the current smallest num in al(since we use db(1 byte)), for now we initialize it as the first element in myArray
   mov esi, arrayLength - edi ; Calculate the new amount of needed checks, done as = arraylength - iterations we have already done
   mov ebx, 0 ; Reset the amount of checks done in the inner_loop

   cmp esi, 0 ; Compare the current needed amount of checks to 0
   jz end_of_sorting  ; Exit the program if we have no elements to check anymore

   jmp inner_loop

inner_loop: ; In the innerloop we will loop over each element in the array to see if it is smaller than the current smallest

   inc ebx ; Increment the current index 
   cmp al, [myArray + ebx] ; Create a pointer to memory adress(myArray + ebx's value), then dereference it taking the value of the adress
   jg set_lowest_number

   cmp ebx, esi ; compare how many elements we've checked in the array to how many elements can be checked
   jz outer_loop

   jmp inner_loop


set_lowest_number:
   mov al, [myArray + ebx]
   jmp inner_loop
   
rearrange_array: ; We remove the smallest number from the array, then we scoot up all the other elements accordingly
   
   
end_of_sorting:
   invoke ExitProcess, 0
   
   
  
