#lang racket

(define (numer x) (car x))		
(define (denom x) (cdr x))		
(define (make-rat n d) (cons n d))	

(define(print-rat x)		  
  (display (numer x))
  (display "/")
  (display (denom x))
  (display " "))

(define (print-list input-list)
  (for ([i (in-list input-list)])
  (print-rat i)))

(define count 0)

(define (irreducible input-list)
  (for ([i (in-list input-list)]
                    #:when (= (gcd (numer i) (denom i)) 1))
           (set! count (+ count 1)))
        (for/list ([i (in-list input-list)]
                   #:when (= (gcd (numer i) (denom i)) 1))
          i))

(define fr1 (make-rat 4 7) )  
(define fr2 (make-rat 7 5) )
(define fr3 (make-rat 18 9) )
(define fr4 (make-rat 2 10) )
(define fr5 (make-rat 25 30) )
(define fr6 (make-rat 3 10) )
(define fr7 (make-rat 9 7) )
(define fr8 (make-rat 10 1) )

(define rational-list (list fr1 fr2 fr3 fr4 fr5 fr6 fr7 fr8))
(print-list rational-list)

(newline)

(print-list (irreducible rational-list))
(begin (display "\nIrreducible fractions count: ") (display count))