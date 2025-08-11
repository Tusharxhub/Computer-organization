;write a 8085 assembly program to add two 8 bit stored at memory location 2050H & 2051H. Store the 8 bit sum at 2052H

	; Program: Add two 8-bit numbers stored at 2050H & 2051H
; Result: 8-bit sum stored at 2052H (carry ignored)
; Processor: 8085

        LDA 2050H       ; Load first number into A
        MOV B, A        ; Copy it to register B
        LDA 2051H       ; Load second number into A
        ADD B           ; A = A + B  (carry ignored)
        STA 2052H       ; Store result at 2052H
        HLT             ; Halt the program


; Output:
;2050H = 25H  (37 decimal)
;2051H = 34H  (52 decimal)
;2052H = 59H  (89 decimal)
;2053H = 00H  (No carry)
