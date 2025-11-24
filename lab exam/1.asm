; A smallembedded controller program powered by the intel 8085 processor is used inside a banking terminal for handling secure data movements.arithmetic operations , and basic logical decision-making.During testing,the following operational requirements were identified.You must design efficent 8085 assembly language programs foe each task described below - The banking terminal stores multiple transaction amounts in an array. write programs to arrange the array in assending order.



; A smallembedded controller program powered by the intel 8085 processor is used inside a banking terminal for handling secure data movements.arithmetic operations , and basic logical decision-making.During testing,the following operational requirements were identified.You must design efficent 8085 assembly language programs foe each task described below - The banking terminal stores multiple transaction amounts in an array. write programs to arrange the array in assending order.


; Assume array length at 8000H, elements from 8001H onwards

LXI H,8000H       ; HL = starting address of array
MOV C, M          ; C = number of elements, from 8000H
DCR C             ; For (n-1) passes

LOOP1:            ; Outer loop for passes
MOV B, C          ; B = (n-1), inner swaps
LXI H,8001H       ; HL = 1st data element address

LOOP2:            ; Inner loop for swapping
MOV A, M          ; A = array[i]
INX H
MOV D, M          ; D = array[i+1]

CMP D             ; Compare array[i] with array[i+1]
JC NO_SWAP        ; If array[i]<array[i+1], do nothing

; Swap array[i] and array[i+1]
MOV M, A          ; array[i+1] = array[i]
DCX H
MOV M, D          ; array[i] = array[i+1]
INX H

NO_SWAP:
DCR B
JNZ LOOP2         ; Repeat inner loop

DCR C
JNZ LOOP1         ; Repeat outer loop

HLT               ; Stop program
