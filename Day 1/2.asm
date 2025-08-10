;Write an 8085 microprocessor assembly language program to:
;1. Copy the content of memory location 2050H to register B.
;2. Move the content of register B to memory location 2060H.




LDA 2050H      ; Load the content of memory location 2050H into accumulator
MOV B, A       ; Copy the content of accumulator into register B
MOV A, B       ; Move the content of register B back into accumulator
STA 2060H      ; Store the content of accumulator into memory location 2060H
HLT            ; Stop execution



;output

;2050H → 4AH   ;(unchanged)
;2060H → 4AH   ;(newly copied)




;2050H → 4AH  ; Unchanged
;B     → 4AH  ; Copy of 2050H content
;2060H → 4AH  ; New copied value
