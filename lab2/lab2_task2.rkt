#lang racket
(define (proper-factors-of m)
                (filter
                    (lambda (x) (= 0 (modulo m x)))

                    (sequence->list (in-range 1 m))))

                (define (is-perfect? m)
                (and
                    (> (length (proper-factors-of m)) 1)

                    (= (apply + (proper-factors-of m)) m)))

                (define n (string->number(read-line (current-input-port) 'any)))
                (display 
                (filter is-perfect? 
                    (sequence->list (in-range n))))
