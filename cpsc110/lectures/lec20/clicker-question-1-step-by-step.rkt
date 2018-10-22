;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname clicker-question-1-step-by-step) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define a 20)
(define (bar z)
  (local [(define a 2)
          (define (bar x)
            (+ x 1))]
    
    (bar (+ a z))))

(bar 10)


; 1
(local [(define a 2)
        (define (bar x)
          (+ x 1))]
    
  (bar (+ a 10)))

; 2
(define a_0 2)
(define (bar_0 x)
  (+ x 1))

(bar_0 (+ a_0 10))

; 3
(bar_0 (+ 2 10))

; 4
(bar_0 12)

; 5
(+ 12 1)

; 6
13