#lang racket

  (define (nums)
    (define n (string->number(read-line (current-input-port) 'any)))
    (cond
      ((= n 0) n)
    (else (cond ((even? (nums)) (display n)))
          n)
     ))
    
   



    ;(if (even? n) ((display (nums)) n) (nums)))

         
   ; (cond
    ;       ((even? (nums)) (display n) n)
     ;      (else (nums))))





         ;((display ((odd? (nums)) n " ")) n)))



        ;(if (odd? n) ((display n) (nums)) (nums))

(nums)

