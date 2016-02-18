; PQR.pep
;
; Read three values P, Q and R from the user and store them in memory.
; Then, after computing a function of all three numbers and storing
; it in RESULT, print the value of RESULT.
;
; Author: B. Bird - 02/14/2016
; Modified by: (your name and student number here)

         STRO    PROMPT, d   ; Ask for a number
         DECI    P, d     ; Read the number into P
         STRO    PROMPT, d   ; Ask for another number
         DECI    Q, d     ; Read the second number into Q
         STRO    PROMPT, d   ; Ask for another number
         DECI    R, d     ; Read the third number into R

         ; Your code here: Compute the value 3*P + 2*Q + R and
         ; store it in RESULT.
         ; (To multiply by 3 and 2, you can use repeated addition)
         
         STRO    RESSTR, d  ; Print 'Result: '
         DECO    RESULT, d  ; Print the value of the result
         CHARO   '\n', i    ; End the line
         STOP               ; End the program

; Data section
P:       .WORD 0
Q:       .WORD 0
R:       .WORD 0
RESULT:  .WORD 0
PROMPT:  .ASCII "Enter a number: \x00"
ENTERED: .ASCII "Numbers entered: \x00"
RESSTR:  .ASCII "Result: \x00"

         .END
