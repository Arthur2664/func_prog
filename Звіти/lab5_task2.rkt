#lang racket

(define (Myreal-part z) (car z))
(define (Myimag-part z) (cdr z))

(define (square x)
  (* x x))

(define (magnitude1 z)
  (sqrt (+ (square (Myreal-part z)) (square (Myimag-part z)))))
(define (angle1 z)
  (atan (Myimag-part z) (Myreal-part z)))
(define (make-from-real-imag x y)
  (if (< x 0)(display x) 1)
  (display " ")
  (if (< y 0)(display y) 1)
  (newline)
  (cons x y))
(define (make-from-mag-ang r a)
  (cons (* r (cos a)) (* r (sin a))))

(list (make-from-real-imag 4 1) (make-from-real-imag -2 -1) (make-from-real-imag 5 9) (make-from-real-imag -3 -10))
            