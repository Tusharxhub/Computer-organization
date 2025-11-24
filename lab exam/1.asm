; A smallembedded controller program powered by the intel 8085 processor is used inside a banking terminal for handling secure data movements.arithmetic operations , and basic logical decision-making.During testing,the following operational requirements were identified.You must design efficent 8085 assembly language programs foe each task described below - The banking terminal stores multiple transaction amounts in an array. write programs to arrange the array in assending order.



; Program: Sort an array in ascending order (Bubble Sort)
; Processor: Intel 8085
; Assumptions:
;   - Array starts at memory location 9000H
;   - First byte at 9000H = number of elements (N)
;   - Next N bytes = transaction amounts
;   - Sorted result will overwrite the same memory locations

        ORG 8000H        ; Program start address

START:  LXI H, 9000H     ; HL points to array start
        MOV B, M         ; B = N (number of elements)
        DCR B            ; B = N-1 (passes required)

PASS:   LXI H, 9001H     ; HL points to first element
        MOV C, B         ; C = number of comparisons in this pass

COMPARE:MOV A, M         ; A = current element
        INX H            ; HL -> next element
        CMP M            ; Compare A with next element
        JC NOSWAP        ; If A < M, no swap needed

        ; Swap elements
        MOV D, M         ; D = next element
        MOV M, A         ; Store smaller value in next location
        DCX H            ; HL -> previous element
        MOV M, D         ; Store larger value in previous location
        INX H            ; HL -> next element again

NOSWAP: DCR C            ; Decrement comparison count
        JNZ COMPARE      ; Repeat until C = 0

        DCR B            ; Decrement pass count
        JNZ PASS         ; Repeat passes until sorted

        HLT              ; End of program
