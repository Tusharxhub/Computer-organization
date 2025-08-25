; Program: Add two 8-bit numbers stored in 2070H and 2071H 
; using repetitive addition
; Result is stored at 2072H

    LDA 2070H       ; Load first number into A
    MOV C,A         ; Copy first number to C (multiplicand)
    LDA 2071H       ; Load second number into A
    MOV B,A         ; Copy second number to B (multiplier / counter)

    MVI A,00H       ; Clear accumulator (to store sum)
    MOV D,A         ; D = 00H (for storing sum)
    
ADD_LOOP: 
    ADD C           ; Add first number (C) to accumulator
    DCR B           ; Decrement counter
    JNZ ADD_LOOP    ; Repeat until B = 0

    STA 2072H       ; Store result at 2072H
    HLT             ; Stop


