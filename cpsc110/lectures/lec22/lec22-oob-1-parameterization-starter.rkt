;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lec22-oob-1-parameterization-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

;;Complete the design of the map2 abstract function with signature

(@HtDF squares)
(@signature (listof Number) -> (listof Number))
;; produce list of sqr of every number in lon
(check-expect (squares empty) empty)
(check-expect (squares (list 3 4)) (list 9 16))

(define (squares lon) (map2 sqr lon))

(@HtDF square-roots)
(@signature (listof Number) -> (listof Number))
;; produce list of sqrt of every number in lon
(check-expect (square-roots empty) empty)
(check-expect (square-roots (list 9 16)) (list 3 4))

(define (square-roots lon) (map2 sqrt lon))

(@HtDF map2)
(@signature (T -> U) (listof T) -> (listof U))
;; given fn and (list n0 n1 ...) produce (list (fn n0) (fn n1) ...)
(check-expect (map2 sqr empty) empty)
(check-expect (map2 sqr (list 2 4)) (list 4 16))
(check-expect (map2 sqrt (list 16 9)) (list 4 3))
(check-expect (map2 abs (list 2 -3 4)) (list 2 3 4))
(check-expect (map2 number->string (list 1 2 3)) (list "1" "2" "3"))
(check-expect (map2 string-length (list "a" "abc" "ab")) (list 1 3 2))
;; write a check expect that consumes a list of numbers and converts it
;; to a list of strings
;; write a check expect that consumes a list of strings and produce a list of
;; its lengths

(@template (listof T) add-param)
(define (map2 fn lon)
  (cond [(empty? lon) empty]
        [else
         (cons (fn (first lon))
               (map2 fn (rest lon)))]))

;; ====================

;;Complete the design of the filter2 abstract function with signature

(@HtDF positive-only)
(@signature (listof Number) -> (listof Number))
;; produce list with only postive? elements of lon
(check-expect (positive-only empty) empty)
(check-expect (positive-only (list 1 -2 3 -4)) (list 1 3))

(@template use-abstract-fn)
(define (positive-only lon)
  (filter2 positive? lon))


(@HtDF negative-only)
(@signature (listof Number) -> (listof Number))
;; produce list with only negative? elements of lon
(check-expect (negative-only empty) empty)
(check-expect (negative-only (list 1 -2 3 -4)) (list -2 -4))

(define (negative-only lon)
  (filter2 negative? lon))


(@HtDF filter2)
;; ????????????????????????????????????????????? SIGNATURE
;; produce list of only those elements of lst for which p produces true
(check-expect (filter2 positive? empty) empty)
(check-expect (filter2 positive? (list 1 -2 3 -4)) (list 1 3))
(check-expect (filter2 negative? (list 1 -2 3 -4)) (list -2 -4))



(define (filter2 p lox)
  (cond [(empty? lox) empty]
        [else 
         (if (p (first lox))
             (cons (first lox) 
                   (filter2 p (rest lox)))
             (filter2 p (rest lox)))]))


