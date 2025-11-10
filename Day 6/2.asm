;write an 8085 assembly language programme to implement the truth table and functionalities of basic logic gates ( AND, OR, NOT, NAND, NOR, XOR, XNOT).


ORG 2000H
MVI A, 55H ; Example value A = 01010101
MVI B, 0FH ; Example value B = 00001111
; ---------- AND ----------
ANA B ; A = A AND B
STA 2100H
; ---------- OR ----------
MVI A, 55H
MVI B, 0FH
ORA B ; A = A OR B
STA 2101H
; ---------- XOR ----------
MVI A, 55H
MVI B, 0FH
XRA B ; A = A XOR B
STA 2102H
; ---------- NOT ----------
MVI A, 55H
CMA ; A = NOT A
STA 2103H
; ---------- NAND ----------
MVI A, 55H
MVI B, 0FH
ANA B
CMA ; NAND = NOT(AND)
STA 2104H
; ---------- NOR ----------
MVI A, 55H
MVI B, 0FH
ORA B
CMA ; NOR = NOT(OR)
STA 2105H
; ---------- XNOR ----------
MVI A, 55H
MVI B, 0FH
XRA B
CMA ; XNOR = NOT(XOR)
STA 2106H
HLT;
Output:
2100H → 05H
2101H → 5FH
2102H → 5AH
2103H → AAH
2104H → FAH
2105H → A0H
2106H → A5H