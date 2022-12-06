#lang racket
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

(define (coss x . n)
  (cond ((not (null? n))
         (cond ((< 25 (car n))
                0)
               (else (- (/ (expt x (car n)) (factorial (car n)))
                        (coss x (+ 2 (car n)))))))
        (else (- x (coss x 2)))))

(define (counting x)
  (cond
    [(and (<= -2 x) (<= x 1))
     (display "for x = ") + (display x) + (display "   y = ")+
     (display(* (sqr (coss x)) (coss (sqr x)))) +
     (display"\n") +
     (counting (+ x 0.5))]
    
    [(and (< 1 x) (<= x 3))
     (display "for x = ") + (display x) + (display "   y = ")+
     (display(/ (coss (/ x 2)) (coss (+ x 0.5)))) +
     (display"\n") +
     (counting (+ x 0.5))]
  ))

;(counting -2)



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
  
