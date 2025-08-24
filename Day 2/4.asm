;WAP A 8085 ASSEMBLY LANGUAGE PROGRAM TO SUBTRACT THE CONTENT OF MEMORY LOCATION 2061H FROM THE CONTENT OF MEMORY LOCATION 2060H.STORE THE RESULE AT 2062H. IF THERE IS ANY BORROW STORE IT AT 2063H

	LDA 2060H      ; A = (2060H) minuend
	MOV B, A       ; Save minuend in B
	LDA 2061H      ; A = (2061H) subtrahend
	MOV C, A       ; Save subtrahend in C
	MOV A, B       ; Restore minuend to A
	SUB C          ; A = minuend - subtrahend (CY=borrow)
	STA 2062H      ; Store result (two's complement if borrow)
	JNC NOBOR      ; If no borrow, skip setting 1
	MVI A,01H      ; Borrow occurred
	STA 2063H
	HLT
NOBOR:  MVI A,00H      ; No borrow
	STA 2063H
	HLT





;output


; Example 1: (2060H)=58H, (2061H)=12H -> 46H, borrow=0 -> 2062H=46H, 2063H=00H
; Example 2: (2060H)=12H, (2061H)=58H -> result = BAH (two's comp of 46H), borrow=1 -> 2062H=BAH, 2063H=01H



