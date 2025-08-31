; Write an 8085 program to divide the content of 2010H by 2011H using repeated subtraction and store quotient at 2050H, remainder at 2051H.



; Initialize memory locations
        LDA 2010H       ; Load dividend into A
        MOV B, A        ; Store dividend in B (temp)
        LDA 2011H       ; Load divisor into A
        MOV C, A        ; Store divisor in C
        MVI D, 00H      ; Initialize quotient = 0

DIV_LOOP: CMP C          ; Compare A (dividend) with divisor
          JC DIV_DONE    ; If A < C, division is complete
          SUB C          ; A = A - C (subtract divisor)
          INR D          ; Increment quotient
          JMP DIV_LOOP   ; Repeat

DIV_DONE: STA 2051H      ; Store remainder (A)
          MOV A, D       ; Move quotient into A
          STA 2050H      ; Store quotient
          HLT
