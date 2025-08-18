
; 8085 program to add two 16-bit numbers
; First number: 2100H (low), 2101H (high)
; Second number: 2102H (low), 2103H (high)
; Result: 2104H (low), 2105H (high), carry at 2106H

	LHLD 2100H      ; Load first 16-bit number into HL
	XCHG            ; HL <-> DE, DE = first number
	LHLD 2102H      ; Load second 16-bit number into HL
	MOV A, E        ; Add low bytes: A = E (first low)
	ADD L           ; A = E + L (second low)
	STA 2104H       ; Store low byte of result
	MOV L, A        ; L = result low
	MOV A, D        ; Add high bytes: A = D (first high)
	ADC H           ; A = D + H + carry
	STA 2105H       ; Store high byte of result
	JNC NOCARRY     ; If no carry, skip
	MVI A,01H       ; Set carry = 1
	STA 2106H       ; Store carry
	HLT
NOCARRY: MVI A,00H      ; No carry
	STA 2106H
	HLT

; Example:
; 2100H=34H, 2101H=12H (1234H), 2102H=CDH, 2103H=ABH (ABCDH)
; Result: BE01H, carry=0



;output

; Example 1: (2100H)=34H, (2101H)=12H -> 46H, carry=0 -> 2104H=46H, 2106H=00H
; Example 2: (2100H)=12H, (2101H)=58H -> result = BAH (two's comp of 46H), carry=1 -> 2104H=BAH, 2106H=01H
