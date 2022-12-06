#lang racket
(define (trapezoidal f a b n)
  (let ((step (/ (- b a) n)))
    (* (/ step 2) (+ (tr_first_last f a b) (tr_doubled f (+ a step) b step))
  )))


(define (tr_first_last f a b)
  (+ (f a) (f b)))
(define (tr_doubled f a b step)
  (if (>= a b)
      0
      (+ (* 2 (f a)) (tr_doubled f (+ a step) b step))))


(display "trapezoidal method: ")
(trapezoidal
 (lambda (x) (/ (cos x) (sqrt x))) 0.1 2 4)



(define (simpsons f a b n)
  (cond ((odd? n)
         (error "N should be an even number:" n)))
  (let ((step (/ (- b a) n)))
    (* (/ step 3)
       (+ (sm_first_last f a b) (sm_quadrupled f (+ a step) b step) (sm_doubled f (+ a (* 2 step)) b step))
       )))

(define (sm_first_last f a b)
  (+ (f a) (f b)))
(define (sm_quadrupled f a b step)
  (if (>= a b)
      0
      (+ (* 4 (f a)) (sm_quadrupled f (+ a (* 2 step)) b step))))
(define (sm_doubled f a b step)
  (if (>= a b)
      0
      (+ (* 2 (f a)) (sm_doubled f (+ a (* 2 step)) b step))))


(display "Simpson's method: ")
(simpsons
 (lambda (x) (/ (cos x) (sqrt x))) 0.1 2 4)

    