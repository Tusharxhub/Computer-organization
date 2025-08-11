; WAP: 8085 program to add two 8-bit numbers at 2050H & 2051H.
; Store 8-bit sum at 2052H and generated carry (0/1) at 2053H.

	LDA 2050H      ; Load first number into A
	MOV B, A       ; Save it in B
	LDA 2051H      ; Load second number into A
	ADD B          ; A = second + first (flags set)
	STA 2052H      ; Store low 8-bit sum
	JNC NOCR       ; If no carry, skip setting 1
	MVI A,01H      ; Carry = 1
	STA 2053H
	HLT
NOCR:   MVI A,00H      ; Carry = 0
	STA 2053H
	HLT

; Output:
; 2050H=F0H, 2051H=30H -> Sum = 0120H => 2052H=20H, 2053H=01H