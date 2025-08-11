; WAP: 8085 program to subtract byte at 2061H from byte at 2060H
; Operation: (2060H) - (2061H)
; Store 8-bit result at 2062H. (Two's complement if borrow occurs.)
; Optional: store borrow (if generated) at 2063H (0 = no borrow, 1 = borrow)

	LDA 2060H      ; A = (2060H)
	MOV B, A       ; B = minuend
	LDA 2061H      ; A = (2061H) subtrahend
	MOV C, A       ; C = subtrahend (optional save)
	MOV A, B       ; A = minuend again
	SUB C          ; A = minuend - subtrahend (flags set; CY=borrow)
	STA 2062H      ; Store result (two's complement if borrow)
	HLT

; To also record borrow at 2063H, use below instead of single HLT:
;        JNC NOBOR
;        MVI A,01H     ; Borrow occurred
;        STA 2063H
;        HLT
;NOBOR:  MVI A,00H     ; No borrow
;        STA 2063H
;        HLT


;output

; Example 1: (2060H)=50H, (2061H)=20H -> 50H-20H=30H, 2062H=30H, borrow=0
; Example 2: (2060H)=20H, (2061H)=50H -> result = D0H (two's complement of 30H), borrow=1

