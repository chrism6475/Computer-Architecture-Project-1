	//Authors: Christian Michel and Chris Benka
	
		.ORIG x3000
		AND R0, #0
		AND R1, #0
		AND R2, #0
		AND R3, #0
		AND R4, #0
		AND R5, #0
		AND R6, #0
		AND R7, #0
		LD  R0, YY ;YEAR
		LD 	R1, MM; MONTH
		LD  R2, DAY ;
		ADD R1, R1, #-2 ;IF RESULT IS ZERO OR NEGATIVE, DON't branch 
		ST R1, x31F4; STORE AS OPERAND FOR MODULO
		BRp POS
		ADD R0, R0, #-1
		BRnzp CONT
POS		ST R0, YY
		JSR DIVISION 
		LD R1, (WHATEVER LOCATION OF MODULO) 
		ST R3, (MEM LOCATION); OPERAND FOR MODULO
		ADD R7, #4
		ST R7
		JSR DIVISION ;YY MOD 4
		
		JSR  MULTIPLY ;
		LD R3, MEM RESULT
		JSR DIVISION ;YY MOD 100
		JSR MULTIPLY ;RESULT * 4
		LD R4, MEM
		JSR DIVISION ; YY MOD 400
		JSR MULTIPLY ;6 X RESULT
		LD R5, MEM
		ADD R6, #2.6
		ST R6, MEMFMULTIPLY 
		JSR MULTIPLY ; 
		LD R1, MEM
		ADD R1, #-.2
		

		
		 	  
		
		
x3100:	CC .FILL #0; CONTENTS OF REGISTER 5 USED FOR DIVISION	
x31EF:		display, STRINGZ "The day is"
x31F0: DD	.FILL #4
x31F1: MM	.FILL #7
x31F2: YY	.FILL #1999
x31F3:


MULTIPLY ST R0, SAVE0
		 ST R1, SAVE1
		 ST R2, SAVE2
		 ST R3, SAVE3
		 ST R4, SAVE4
		 ST R5, SAVE5
		 ST R6, SAVE6
		 ST R7, SAVE7
		 LD R6, A
		 LD	R7, B
		 NOT R5, R6
		 ADD R5, R5, #1
		 ADD R5, R7, R5
		 BRnz ABIG
		 ADD R1, R7 #0
		 ADD R2, R6, #0
		 BRnzp NEXT
ABIG	ADD R1, R6, #0
		ADD R2, R7, #0
NEXT 	AND R0, R0 #0
LOOP	ADD R0, R0 , R1
		ADD R2, R2 #-1
		BRp LOOP
		ADD R3, R0, #0 ;RESULT
		ST R3, RESULT
		LD R0, SAVE0 ; RESTORE INITIAL VALUES
		LD R1, SAVE1
		LD R2, SAVE2
		LD R3, SAVE3
		LD R4, SAVE4
		LD R5, SAVE5
		LD R6, SAVE6
		LD R7, SAVE7
		RET
x3100:	CC .FILL #0; CONTENTS OF REGISTER 5 USED FOR DIVISION	
x31EF:		display, STRINGZ "The day is"
x31F0: DD	.FILL #4
X31F1: MM	.FILL #7
x31F2: YY	.FILL #1999
x31F3:		
X31F4: AM 	.FILL #88 ;OPERAND A FOR MULTIPLY
X31F5: BM	.FILL #3	;OPERAND B FOR MULTIPLY
X31F6: AD				;OPERAND A FOR DIVISION
X31F7: BD				;OPERAND B FOR DIVISION
