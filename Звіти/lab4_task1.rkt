#lang racket

(define (perf n)
  (let loop ((i 1)
             (sum 0))
    (cond ((= i n)
           (= sum n))
          ((= 0 (modulo n i))
           (loop (+ i 1) (+ sum i)))
          (else
           (loop (+ i 1) sum)))))


(define (isfactorial n)
  (for ([i (in-naturals 1)])
    #:break (not (zero? (modulo n i)))
    #:break (zero? n)
    (set! n (/ n i)))
  (cond ((= n 1)
         #true)
        (else #false)))
(define c 0) 
(define (removed-factorials input-list)

         (for/list ([i (in-list input-list)]
                    #:when (isfactorial i))
           (set! c (+ c 1)))
         (for/list ([i (in-list input-list)]
                    #:when (not (isfactorial i)))
           i))


(define (last-digits input-list digit)
        (for/list ([i (in-list input-list)]
                   #:when (= (remainder i 10) digit))
          i))



 (define perfectlist
  (for/list ([n (in-range 1 10000)]
             #:when (perf n))
    n))
(begin (display "List of perfect numbers: ")(display perfectlist))
(begin (display "\nThis list without factorials: ")(display (removed-factorials perfectlist)))
(begin (display "\nFactorials count is ") (display c))
(begin (display "\nEnter last digit of the number ")(define digit (read)))
(begin (display "\nResult: ")(display (last-digits perfectlist digit)))


