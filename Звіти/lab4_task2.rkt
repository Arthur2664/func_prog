#lang racket

(define k 12)
(define p 10)
(define m 5)
(define n 8)
(define r 4)

(define count 25) ;початкова кількість людей на зупинці
(define total 0) ;кількість перевезених людей

(define (run)
  (define (inner-2 mt)
    (if (and (<= mt m)
             (> count 0))
        (let ((kt (if (< (+ p count) k) (+ p count) k)))
          (set! count (+ (- count kt) p))
          (set! total (+ kt total))
          (display kt) (display " людей поїхали на маршрутці No") (display mt)
          (newline) (inner-2 (+ 1 mt)))
        (begin (display "Людей на зупинці в кінці циклу: ") (display count))))
  (define (inner-1 rt)
    (if (and (<= rt r)
             (> count 0))
        (begin (newline) (newline) (display rt) (display "-й цикл") (newline) (newline)
               (inner-2 1) (inner-1 (+ rt 1)))
        (begin (display "\n_________________________________\n")
               (display "Всього перевезено ") (display total) (display " людей"))))
  (inner-1 1))
(run)