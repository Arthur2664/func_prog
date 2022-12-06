#lang racket

(define (writeDataToFile data file) (display-lines-to-file data file #:exists 'replace #:mode 'text))
(define (nextLine file)
  (let ((line (read-line file 'any)))
    (if (eof-object? line)'()
        (begin (displayln line)
               (append (list line) (nextLine file))))))
(define path "E:\\Racket\\labs")
(define words (list "Yakymchuk Artur"
                    "Functional programming"
                    "Lab No 7"
                    "Variant No 11"))

(writeDataToFile words ( string-append path "input.txt"))
(display "\nContent of the file:\n")
(define readData (call-with-input-file ( string-append path "input.txt") nextLine))
(define removeData( remove "Lab No 7" (list "Yakymchuk Artur"
                                            "Functional programming"
                                            "Lab No 7"
                                            "Variant No 11")))

(writeDataToFile removeData (string-append path "output.txt"))
(display "\nData was succesfully transfered to the new file!") (newline)
(display "\nContent of the new file:\n")
(define rm-data (call-with-input-file ( string-append path "output.txt") nextLine))