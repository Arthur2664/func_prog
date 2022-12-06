#lang racket

(define (fibonacci m n)
  (if (< m n)(error "\nn is out of range")
      (fib m n 1 0 0)))

(define (fib m n j k d)
  (display j)
  (cond
    ((= m 1) (display "\nthe depth is ") (display d)
             (display "\nthe n-th value is ") (display n))
    
    (else (cond ((= n (+ d 1)) (set! n j)))
          (fib (- m 1) n (+ j k) j (+ d 1)))))

(define m (string->number(read-line (current-input-port) 'any)))
(define n (string->number(read-line (current-input-port) 'any)))

(fibonacci m n)
