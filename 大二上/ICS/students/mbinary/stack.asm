	;R6 IS THE STACK POINTER 
	;THE DATA IS STORED IN R1,R0, TO FORM A NUM
	;R5 STORES THE INFO THAT INDICATES SUCCESS(0) OR FAILURE(1)
POP	ST R2,SAVER2
	LD R2,BASE
	ADD R2,R2,R6
	ADD R2,R2,#2
	BRz	FAIL
	LDR R0,R6,#0
	ADD R6,R6,#1
	LDR R1,R6,#0
	ADD R6,R6,#1
	BRnzp EXIT

PUSH	ST R2,SAVER2
	ST R3,SAVER3
	LD R2,BASE
	ADD R2,R6,R2
	ADD R2,R2,#-2
	LD R3,MAX
	ADD R2,R2,R3
	BRn	FAIL
	STR R1,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#-1
	LD R3,SAVER3

EXIT	LD R2,SAVER2
	AND R5,R5,#0
	RET
FAIL	LD R2, SAVER2
	AND R5, R5,#0
	ADD R5,R5,#1
	RET




SAVER3	.BLKW	1
SACER2	.BLKW	1
BASE	.FILL	XB000  ; -X4000
MAX	.FILL	X20