; Program: Add two 8-bit numbers stored at memory locations 2050H and 2051H
; Result: 8-bit sum stored at 2052H (carry ignored). Optionally you could store carry at 2053H.
; Processor: 8085

	LDA 2050H      ; Load first operand into A
	MOV B, A       ; Save first operand in B
	LDA 2051H      ; Load second operand into A
	ADD B          ; A = A + B
	STA 2052H      ; Store 8-bit sum (lower byte) at 2052H
	HLT            ; Stop

; If you also want to record carry, uncomment below:
;        JNC NCARRY
;        MVI A,01H
;        STA 2053H     ; Store carry = 1
;        HLT
;NCARRY: MVI A,00H
;        STA 2053H     ; Store carry = 0
;        HLT




