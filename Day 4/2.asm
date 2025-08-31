; Write a 8085 Assembly Language Program to divide the contents of memory location 2010H by the contents of memory location 2011H using the method of repeated subtraction. Store the quotient at 2050H and remainder at 2051H.



; Initialize memory locations
MVI A, 00H        ; Clear accumulator
STA 2050H        ; Store initial quotient as 0
STA 2051H        ; Store initial remainder as 0

; Load dividend and divisor
LDA 2010H        ; Load dividend
MOV B, A        ; Move dividend to B
LDA 2011H        ; Load divisor
MOV C, A        ; Move divisor to C

; Division using repeated subtraction
DIV_LOOP:
    CMP C        ; Compare B (dividend) with C (divisor)
    JC DIV_DONE  ; If B < C, division is done
    SUB C        ; Subtract C from B
    INX D        ; Increment quotient
    JMP DIV_LOOP

DIV_DONE:
    ; Store quotient and remainder
    STA 2050H    ; Store quotient
    LDA 2010H    ; Load original dividend
    SUB 2050H    ; Subtract quotient from dividend
    STA 2051H    ; Store remainder