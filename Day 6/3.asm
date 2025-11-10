;write to 8085 assembly language programme to arrange an array of data in ascending and descending order.


;Ascending: 

ORG 2000H
LXI H, 2050H
MVI B, 05H ; Number of elements
OUTER: LXI H, 2050H
MVI C, 04H ; Inner loop count = size - 1
INNER: MOV A, M
INX H
CMP M
JC SKIP ; If A < M, skip
MOV D, M ; Swap values
MOV M, A
DCX H
MOV M, D
INX H
SKIP: DCR C
JNZ INNER
DCR B
JNZ OUTER
HLT

;Descending:

ORG 2100H
LXI H, 2050H
MVI B, 05H ; Number of elements
OUTER: LXI H, 2050H
MVI C, 04H ; Inner loop count = size - 1
INNER: MOV A, M
INX H
CMP M
JNC SKIP ; If A >= M, skip
MOV D, M ; Swap values
MOV M, A
DCX H
MOV M, D
INX H
SKIP: DCR C
JNZ INNER
DCR B
JNZ OUTER
HLT