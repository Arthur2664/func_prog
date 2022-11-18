#lang racket
;Знайти корені нелінійного рівняння виду x2 - cos x = 0.
;Пошук наближеного значення хоча б одного кореня рівняння f(x) = 0
;на відрізку [a, b] здійснювати методами простої ітерації та перебором.
;Значення a, b інтервалу вибрати самостійно.
;Порівняти результати розв’язків двома методами.
;https://sarabander.github.io/sicp/html/1_002e3.xhtml

;half interval method
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (average x y)
  (/ (+ x y) 2))
(define (close-enough? x y)
  (< (abs (- x y)) 0.000001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((< a-value b-value)
           (search f a b))
         ((> a-value b-value)
           (search f b a))
          (else (error "Can't use the same values:" a b)))))

(display "half interval method: ")
(half-interval-method 
 (lambda (x) (- (* x x) (cos x))) 0.0 2.5)


;brute force method
(define (brute_force a b interval)
  (for ([ x (in-range a b interval)])
    (cond
      [(close-enough? (- (* x x) (cos x)) 0.0)
        (display x)
        (display "\n")
        x])))


(display "brute force method: ")
(brute_force 0.0 2.5 0.000001)