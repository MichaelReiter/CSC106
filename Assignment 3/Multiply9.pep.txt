; Multiply9.pep
; CSC 106 - Spring 2016
; 
; A Pep/8 program to read a number from the user and multiply it by 9.
; This code only works when the user inputs a value which is at least 0.
;
; Since the Pep/8 architecture lacks a multiplication instruction, the
; multiplication is performed by repeated addition (for example, to multiply 7
; by 9, 9 is added to itself 7 times).
;
; Author: B. Bird - 02/11/2016
 
         STRO    PROMPT, d 
         DECI    INPUT, d    ; Read a number from the user

         STRO    RECALL, d
         DECO    INPUT, d    ; Print out the entered value
         CHARO   '\n', i     ; End the line

         STRO    STARTSTR, d      ; Print 'Multiplying by nine...'
         CHARO   '\n', i     ; End the line

         LDA     0, i
         STA     PRODUCT, d  ; Set the product to 0
         LDA     1, i
         STA     COUNTER, d  ; Set the counter to 1
         ; The lines below repeat until counter is equal to INPUT
LOOP:    LDA     COUNTER, d  ; Load the counter into A
         CPA     INPUT, d    ; Compare the value of the counter (which is stored in A) to the user's input value
         BRGT    DONE, i     ; If the counter was larger than the input value, jump to the DONE label
         LDA     PRODUCT, d  ; Load the current value of the product into A
         ADDA    9, i        ; Add 9 to the current product
         STA     PRODUCT, d  ; Store the updated product back to memory
         LDA     COUNTER, d  ; Load the counter into A
         ADDA    1, i        ; Add 1 to the counter
         STA     COUNTER, d  ; Store the updated counter back to memory
         BR      LOOP, i     ; Jump back to the LOOP label

         ; When the DONE label is reached, the product has been fully computed
DONE:    STRO    ENDSTR, d   ; Print 'Result = '
         DECO    PRODUCT, d  ; Print the product
         CHARO   '\n', i     ; End the line
         STOP

INPUT:   .WORD 0 ; Storage for the user's input value
PRODUCT: .WORD 0 ; Storage for the product 9*INPUT
COUNTER: .WORD 0 ; Storage for the counter

PROMPT:  .ASCII "Enter a number: \x00"
RECALL:  .ASCII "You entered \x00"
STARTSTR:.ASCII "Multiplying by nine...\x00"
ENDSTR:  .ASCII "Result = \x00"
         .END