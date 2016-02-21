; MultiplyYZ.pep
; CSC 106 - Spring 2016
; 
; A Pep/8 program to read two number from the user and multiply them.
;
; Since the Pep/8 architecture lacks a multiplication instruction, the
; multiplication is performed by repeated addition (for example, to multiply 7
; by 9, 9 is added to itself 7 times).
;
; Author: B. Bird - 02/11/2016
; Modified by: Michael Reiter, V00831568

         STRO    PROMPT, d   ; Ask for a number
         DECI    NUM1, d     ; Read the number into NUM1
         STRO    PROMPT, d   ; Ask for another number
         DECI    NUM2, d     ; Read the second number into NUM2

         STRO    ENTERED, d  ; Display 'Numbers Entered: ' 
         DECO    NUM1, d     ; Print NUM1 
         CHARO   ' ', i      ; Print a space
         DECO    NUM2, d     ; Print NUM2
         CHARO   '\n', i     ; End the line

         LDA     0, i
         STA     PRODUCT, d  ; Set the product to 0
         LDA     1, i
         STA     COUNTER, d  ; Set the counter to 1

         ; The lines below repeat until counter is equal to NUM1
LOOP:    LDA     COUNTER, d  ; Load the counter into A
         CPA     NUM1, d     ; Compare the value of the counter (which is stored in A) to the user's input value 
         BRGT    DONE, i     ; If the counter was larger than the input value, jump to the DONE label
         LDA     PRODUCT, d  ; Load the current value of the product into A
         ADDA    NUM2, d     ; Add NUM2 to the current product
         STA     PRODUCT, d  ; Store the updated product back to memory
         LDA     COUNTER, d  ; Load the counter into A
         ADDA    1, i        ; Add 1 to the counter
         STA     COUNTER, d  ; Store the updated counter back to memory
         BR      LOOP, i     ; Jump back to the LOOP label

         ; When the DONE label is reached, the product has been fully computed
DONE:    STRO    ENDSTR, d   ; Print 'Product: '
         DECO    PRODUCT, d  ; Print the product
         CHARO   '\n', i     ; End the line
         STOP

NUM1:    .WORD 0 ; Storage for user input
NUM2:    .WORD 0 ; Storage for user input
PRODUCT: .WORD 0 ; Storage for the product of the inputs
COUNTER: .WORD 0 ; Storage for the counter

PROMPT:  .ASCII "Enter a number: \x00"
ENTERED: .ASCII "Numbers entered: \x00"
STARTSTR:.ASCII "Multiplying by nine...\x00"
ENDSTR:  .ASCII "Product: \x00"
         .END