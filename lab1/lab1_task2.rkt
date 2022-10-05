#lang racket

  (define (nums)
    (define n (string->number(read-line (current-input-port) 'any)))
    (cond
      ((= n 0) n)
    (else (cond ((even? (nums)) (display n)))
          n)
     ))

(nums)

