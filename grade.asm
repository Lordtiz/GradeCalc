;Created by Julio Ortiz and the team 

.orig		x3000
;
                LEA R4, Scores
		JSR GETDATA                    ;get 1st subject marks
		STR R0,R4,0                    ;store 1st subject marks
 
		JSR GETDATA                    ;get 2nd subject marks
		STR R0,R4,1                    ;store 2nd subject marks
  
		JSR GETDATA                    ;get 3rd subject marks
		STR R0,R4,2                    ;store 3rd subject marks
 
		JSR GETDATA                    ;get 4th subject marks
		STR R0,R4,3                    ;store 4th subject marks
 
		JSR GETDATA                    ;get 5th subject marks
		STR R0,R4,4                    ;store 4th subject marks
                 
                JSR GETMAX                       ;call to GETMAX subroutine
                LEA R0,maxstr                    ;print msg
                PUTS
                LD R0,max
                JSR DISP                         ;call to DISP subroutine

                JSR GETMIN                       ;call to GETMIN subroutine
                LEA R0,minstr                    ;print msg
                PUTS
                LD R0,min
                JSR DISP                         ;call to DISP subroutine

                JSR GETAVG                       ;call to GETAVG subroutine
                LEA R0,avgstr                    ;print msg
                PUTS
                LD R0,avg
                JSR DISP                         ;call to DISP subroutine
              
                LEA R0,grade                    ;print msg
                PUTS
                JSR GETGrade                    ;call to GETGrade subroutine

STOP		HALT
Scores       .BLKW 1
            .BLKW 1
            .BLKW 1
            .BLKW 1
            .BLKW 1
max         .BLKW 1
min         .BLKW 1
avg         .BLKW 1
maxstr .STRINGZ "\nMax Score is: "
minstr .STRINGZ "\nMin Score is: "
avgstr .STRINGZ "\nAvg Score is: "
grade .STRINGZ "\nLetter Grade is: "

;
; Subroutine to get a two digit number
;
GETMAX          ST R7,GDREG7		; store return address
                LEA R5,Scores           ;get the score array address
                LDR R0,R5,0             ;max=score[0]
                AND R1,R1,0
                ADD R1,R1,5
     while      
                LDR R2,R5,0
                NOT R2,R2
                ADD R2,R2,#1
                ADD R3,R0,R2            ;if max>=score[i]
                BRp skip                ;then skip
                LDR R0,R5,0             ;else max=score[i]
    skip
                ADD R5,R5,1
                ADD R1,R1,-1            ;repeat loop 5 times
                BRp while
	         
                ST R0,max
                LD R7,GDREG7             ;restore return address
		RET	

;
; Subroutine to get a two digit number
;
GETMIN          ST R7,GDREG7		; store return address
                LEA R5,Scores           ;get the score array address
                LDR R0,R5,0             ;min=score[0]
                AND R1,R1,0
                ADD R1,R1,5
     while1      
                LDR R2,R5,0
                NOT R2,R2
                ADD R2,R2,1            ;if min<=score[i]
                ADD R3,R0,R2
                BRnz skip1             ;then skip
                LDR R0,R5,0            ;else min=scorei[i]
     skip1
                ADD R5,R5,1
                ADD R1,R1,-1            ;repeat loop 5 times
                BRp while1
	         
                ST R0,min
                LD R7,GDREG7           ;restore return address
		RET	

;
; Subroutine to get a two digit number
;
GETAVG          ST R7,GDREG7		; store return address
                LEA R5,Scores           ;get the score array address
                AND R0,R0,0             ;sum=0
                AND R1,R1,0
                ADD R1,R1,5
     while2      
                LDR R2,R5,0     
                ADD R0,R0,R2            ;sum=sum+scores[i]
                ADD R5,R5,1
                ADD R1,R1,-1             ;repeat loop 5 times
                BRp while2

                AND R1,R1,0
    rep
                ADD R0,R0,-5              ;get average=sum/5
                BRnz brk
                ADD R1,R1,1
                BR rep
   brk	         
                ADD R1,R1,1
                ST R1,avg
                LD R7,GDREG7            ;restore return address
		RET

;
; Subroutine to get get student grade letter
;
GETGrade        ST R7,GDREG7		; store return address
                LD R2,grades
                LD R0,avg               ;get student avergae score
                LEA R5,band
                LDR R1,R5,0
                ADD R3,R0,R1            ;if avg <50 
                BRzp GradeE
                ADD R2,R2,5             ;then grade is F
                BR finish
       GradeE
                LDR R1,R5,1
                ADD R3,R0,R1            ;else if avg>50 and <60
                BRzp GradeD
                ADD R2,R2,4             ;then Grade is E
                BR finish
       GradeD
                LDR R1,R5,2
                ADD R3,R0,R1            ;else if avg>60 and <70
                BRzp GradeC
                ADD R2,R2,3             ;then Grade is D
                BR finish
      GradeC
                LDR R1,R5,3
                ADD R3,R0,R1            ;else if avg>70 and <80
                BRzp GradeB
                ADD R2,R2,2             ;then Grade is C
                BR finish
      GradeB
                LDR R1,R5,4
                ADD R3,R0,R1            ;else if avg>80 and <90
                BRzp GradeA
                ADD R2,R2,1             ;then Grade is B
                BR finish
      GradeA     
                ADD R2,R2,0            ;else Grade is A

     finish
                ADD R0,R2,0
                putc
                LD R7,GDREG7             ;restore return address
		RET	
band .fill -50
     .fill -60
     .fill -70
     .fill -80
     .fill -90

grades .fill 65

;
; Subroutine to get subject score
;
GETDATA         ST R7,GDREG7		; save return address
                AND R5,R5,0
                AND R1,R1,#0
		AND R2,R2,#0
		LEA R0,PROMPT
		LD R6,THIRTY
		PUTS	                ;system call for string output	  
		GETC                    ;system call for char input                      
		OUT
		ADD R0,R0,R6	        ; subtract x30 ascii to dec conversion
                ADD R5,R0,0
                GETC                    ;system call for char input
		OUT
                ADD R3,R0,-10
                BRz retrn
                ADD R0,R0,R6	        ; subtract x30 ascii to dec conversion
                ADD R1,R5,#0	        ; move R0 to R1
                ADD R5,R0,0
		LD  R2,TEN
		JSR MULT		; multiply R1 by 10
                ADD R5,R5,R1
		GETC                    ;system call for char input
		OUT
                ADD R3,R0,-10
                BRz retrn
		ADD R0,R0,R6	        ; subtract x30 ascii to dec conversion
                ADD R1,R5,#0	        ; move R0 to R1
                ADD R5,R0,0
		LD  R2,TEN
		JSR MULT		; multiply R1 by 10
                ADD R5,R5,R1
       retrn
                ADD R0,R5,0	        ; add two registers to get decimal value
                LD R7,GDREG7            ;restore return address
		RET	

GDREG7		.BLKW	  1	        ; use to keep subroutine return address
TEN		.FILL		#10
THIRTY		.FILL		xFFD0		; -48 or neg x30
a               .FILL   #48
PROMPT		.STRINGZ	"\nEnter Test Score: "

;
; function to multiply  
;
MULT            ST R7,MUREG7	       ; save return address
                AND R3,R3,#0	       ; R3 will be the result
AGAIN		ADD R3,R3,R1
		ADD R2,R2,#-1
		BRp AGAIN
		AND R1,R1,#0	       ; falls through when R5 == 0 or -1
		ADD R1,R3,#0
		LD R7,MUREG7	        ;restore return address
		RET				;answer in R1
MUREG7		.BLKW	1


;
; function to Diplay Output 
;

DISP            ST R7,DREG7              ;store return address
                ADD R3,R0,0	       
                LEA R5,Num
                ADD R5,R5,3
L1              LD R2,TEN
                NOT R2, R2
                ADD R2, R2, 1
                ADD R4,R3,0
                AND R3,R3,0                 ;Get the digits of the Number
LOOP2           ADD R4,R4,R2
                BRn Break
                ADD R3,R3,1
                BR LOOP2

Break           ;ADD R3,R3,1
                ADD R4,R4,#10
                ADD R0,R4,0
                LD R4,ascii                    ; add 48 dec to ascii conversion
                ADD R0,R0,R4
                STR R0,R5,0
                Add R5,R5,-1
                ADD R1,R3,-10
                BRzp L1
                ADD R0,R3,0 
                ADD R0,R0,R4
                STR R0,R5,0
                Add R5,R5,-1        
                AND R2,R2,0
Exit            LEA R5,Num                     ;print 1st digit
                LDR R0,R5,0
                OUT 
                STR R2,R5,0 
                LDR R0,R5,1                    ;print 2nd digit
                OUT 
                STR R2,R5,1
                LDR R0,R5,2                    ;print 3rd digit
                OUT 
                STR R2,R5,2
                LDR R0,R5,3
                OUT                            ;print 4th digit
                STR R2,R5,3 
                LD R7,DREG7                    ;restore return address
                RET                            ;return to main

DREG7	.BLKW	1
;TEN .FILL #10
ascii .FILL #48
Num .BLKW 1
    .BLKW 1
    .BLKW 1
    .BLKW 1

 
.END

 
