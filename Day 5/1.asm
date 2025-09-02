; Write an 8085 assembly program to find the one’s complement and two’s complement of a given number.





; Assumptions:
;   Input 8-bit number is stored at memory location 8050H.
;   Store one's complement at 8051H.
;   Store two's complement at 8052H.
; Registers used: A (accumulator) only (B is optional, not needed here).
; Two's complement = (One's complement) + 1.

	LDA 8050H       ; Load the number into A
	CMA             ; A <- one's complement of original
	STA 8051H       ; Store one's complement
	INR A           ; A <- A + 1 (now two's complement)
	STA 8052H       ; Store two's complement
	HLT             ; Stop

; To test (example):
;   Put (e.g.) 3AH at 8050H before execution. After run:
;     8051H = C5H (one's complement of 3A)
;     8052H = C6H (two's complement of 3A)