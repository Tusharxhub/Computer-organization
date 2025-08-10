; Write an 8085 microprocessor program to copy the content of memory location 2050H to memory location 2051H



LDA 2050H      ; Load the content of memory location 2050H into accumulator
STA 2051H      ; Store the content of accumulator into memory location 2051H
HLT            ; Terminate the program



;output

2050H → 4AH   ;(unchanged)
3050H → 4AH   ;(newly copied)
