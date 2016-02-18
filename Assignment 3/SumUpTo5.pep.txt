; SumUpTo5.pep
; CSC 106 - Spring 2016
;
; Compute and print the sum 1 + 2 + 3 + 4 + 5 using a loop.
;
; Author: B. Bird - 02/11/2016

         STRO    STARTSTR,d  ; Print 'Program Starting'
LOOP:    STRO    LOOPSTR, d  ; Print 'Loop iteration'
         LDA     SUM, d      ; Load the current value of the sum into A
         ADDA    COUNTER, d  ; Add the current value of the counter to A
         STA     SUM, d      ; Store the resulting sum back into SUM
         LDA     COUNTER, d  ; Load the counter value into A
         ADDA    1, i        ; Increment the counter by 1 
         STA     COUNTER, d  ; Store the result back into A
         CPA     5, i        ; Compare the value of A with 5
         BRLE    LOOP        ; Jump up to LOOP if the comparison was less than or equal
         
         ; At this point, the loop is over
         ; Print 'Sum computed:'
         STRO ENDSTR, d
         ; Load the value of the sum from memory and print it
         DECO SUM, d 

         STOP


COUNTER: .WORD 1
SUM:     .WORD 0
STARTSTR:.ASCII "Program Starting\n\x00"
ENDSTR:  .ASCII "Sum computed:\n\x00"
LOOPSTR: .ASCII "Loop iteration\n\x00"
         .END