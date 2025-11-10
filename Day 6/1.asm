;write an 8085 assembly language programme to find smallest number from an array.

ORG 2000H
MVI C, 05H ; Counter = number of elements
LXI H, 2050H ; HL points to starting address of array
MOV A, M ; Load first element into A (assume smallest)
INX H ; Move to next memory location
DCR C ; Decrease counter
NEXT: CMP M ; Compare A with next element
JNC SKIP ; If A < M, skip
MOV A, M ; Else update smallest value
SKIP: INX H ; Move to next element
DCR C ; Decrease counter
JNZ NEXT ; Repeat until all elements checked
STA 2060H ; Store smallest number at 2060H
HLT ; Stop program
