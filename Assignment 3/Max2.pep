; Max2.pep
; CSC 106 - Spring 2016
;
; Read two numbers from the user, then print the maximum of the two.
; Author: B. Bird - 02/11/2016
; Modified by: Michael Reiter, V00831568

         STRO    PROMPT, d   ; Ask for a number
         DECI    NUM1, d     ; Read the number into NUM1
         STRO    PROMPT, d   ; Ask for another number
         DECI    NUM2, d     ; Read the second number into NUM2

         LDA     NUM1, d     ; Load the value of NUM1 into register A
         CPA     NUM2, d     ; Compare num1 and num2
         BRGT    num2less, i ; Branch to num2less if num1 > num2 
         BR      num1less, i ; else branch to num1less 

num2less:STA     MAX, d      ; if (num1 > num2) max = num1
         BR      continue, i

num1less:LDA     NUM2, d     ; else max = num2
         STA     MAX, d

continue:STRO    MAXSTR, d   ; Print 'Max: '
         DECO    MAX, d      ; Print the max of the two numbers
         CHARO   '\n', i     ; End the line

end:     STOP                ; End the program

; Data section
NUM1:    .WORD 0 ; Storage for user input
NUM2:    .WORD 0 ; Storage for user input
MAX:     .WORD 0 ; Storage for max of inputs
PROMPT:  .ASCII "Enter a number: \x00"
MAXSTR: .ASCII "Max: \x00"
         .END