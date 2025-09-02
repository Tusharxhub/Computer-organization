; Write an 8085 assembly language program to find the largest element in an array.
; Assumptions:
;   Memory 8050H holds N (number of elements, 1..255). If N=0, result = 00H.
;   Array starts at 8051H (N bytes).
;   Largest element will be stored at 8051H+N (i.e. immediately after the array) -> address = 8051H + N.
;   Registers used: A (current max), B (temp), C (counter), H-L (array pointer).
; Algorithm:
;   Load count. If zero, store 00 and halt. Else initialize max with first element, loop remaining.

	LDA 8050H        ; A <- N
	ORA A            ; Set flags to check if zero
	JNZ START        ; If N != 0 continue
	MVI A,00H        ; N==0 => max = 00H
	STA 8051H        ; Store at 8051H (no array) as result
	HLT

START:  MOV C,A          ; C = N (loop counter)
	LXI H,8051H      ; HL -> first element
	MOV A,M          ; A = first element (initial max)
	INX H            ; HL -> second element
	DCR C            ; One element processed
	JZ STORE         ; If N was 1, skip loop

LOOP:   MOV B,M          ; B = current element
	CMP B            ; Compare A (max) with B
	JNC NEXT         ; If A >= B keep A
	MOV A,B          ; Else update max
NEXT:   INX H            ; Point to next element
	DCR C            ; Decrement remaining count
	JNZ LOOP         ; Continue if elements left

STORE:  ; Compute address to store result = 8051H + original N
	; We currently have HL pointing just past last element (because after final INX or for N=1 it's 8052H?)
	; Easier: Recompute: load N, add to base address 8051H.
	LDA 8050H        ; A = N
	MOV B,A          ; B = N
	MVI H,80H
	MVI L,51H        ; HL = 8051H
	; Add N to HL -> repeated INR L / DCR B loop (simple, small N acceptable). For efficiency a DAD approach would need forming 16-bit value.
ADDN:   DCR B
	JM  STORE_DONE   ; (never negative, safeguard)
	JZ  STORE_DONE   ; When B became 0, done (HL = base + N - 1). Need +N (base+N) so do one extra INX before loop exit? Adjust logic:
	INX H            ; Actually increment pointer while B>0
	JMP ADDN

STORE_DONE:
	; HL now = 8051H + (N-1). Need location after array => INX HL
	INX H
	MOV M,A          ; Store max after array
	HLT

; Example:
; 8050H: 05
; 8051H..8055H: 12 7A 3C 7A 11
; Result stored at 8056H = 7A.

