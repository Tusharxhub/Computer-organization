;write a 8085 assembly program to add two 8 bit stored at memory location 2050H & 2051H. Store the 8 bit sum at 2052H

	LDA 2050H      ; Load first operand into A
	MOV B, A       ; Save first operand in B
	LDA 2051H      ; Load second operand into A
	ADD B          ; A = A + B  (Flags affected)
	STA 2052H      ; Store 8-bit sum (lower byte) at 2052H
	JNC NCARRY     ; If no carry, jump
	MVI A,01H      ; Carry = 1
	STA 2053H      ; Store carry flag value
	HLT
NCARRY: MVI A,00H      ; Carry = 0
	STA 2053H
	HLT

; Output:
; 2050H = AAH (170), 2051H = 90H (144) => 170 + 144 = 314 = 013AH
; Sum low byte (3AH) stored at 2052H, carry (1) stored at 2053H.




