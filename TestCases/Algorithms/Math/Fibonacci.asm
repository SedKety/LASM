.386
include \masm32\include\masm32rt.inc


.data
iterationCount dd 10


.code

main:

   mov eax, 0 ; X
   mov ebx, 1 ; Y

   mov ecx, 0 ; Z, placeholder value

   mov esi, 0
   mov edi, iterationCount

calculate_loop:

   cmp esi, edi
   jz end_of_calculation

   mov ecx, ebx ; Z = X 
   add ecx, eax ; (Z = X) + Y

   mov eax, ebx ; X = Z
   mov ebx, ecx ; Z = Y

   inc esi

   jmp calculate_loop

end_of_calculation: 
   mov edx, ebx
   invoke ExitProcess, 0

end main