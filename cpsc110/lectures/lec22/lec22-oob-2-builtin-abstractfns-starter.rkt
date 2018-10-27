;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lec22-oob-2-builtin-abstractfns-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)
(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 30 20 "solid" "yellow"))
(define I3 (rectangle 40 50 "solid" "green"))
(define I4 (rectangle 60 50 "solid" "blue"))
(define I5 (rectangle 90 90 "solid" "orange"))
(define LOI1 (list I1 I2 I3 I4 I5))

;; PROBLEM 1: Refactor this function to use built in abstract functions.
(@HtDF keep-positive)
(@signature (listof Integer) -> (listof Integer))
;; produce list that only includes positive number from loi
(check-expect (keep-positive empty) empty)
(check-expect (keep-positive (list 2 3 -8 9 -11 -14)) (list 2 3 9))

;(@template (listof Integer))
(@template use-abstract-fn)
(define (keep-positive loi)
  (filter positive? loi))

;(define (keep-positive loi)
;  (cond [(empty? loi) empty]
;        [else
;         (if (positive? (first loi))
;             (cons (first loi) (keep-positive (rest loi)))
;             (keep-positive (rest loi)))]))



;; PROBLEM 2: Complete the design of this function that produce list that only
;; includes the values that are less than 10 using built-in abstract functions.
(@HtDF less-than-10-only)
(@signature (listof Integer) -> (listof Integer))
;; produce list that only includes the values that are less than 10
(check-expect (less-than-10-only empty) empty)
(check-expect (less-than-10-only (list -2 3 8 9 11 14)) (list -2 3 8 9))

;(define (less-than-10-only loi) empty) ;stub

(@template use-abstract-fn)
(define (less-than-10-only loi)
  (filter less-than-10? loi))

;; will be able to do this with Lambda without writing a new function
;; (filter (lambda (x) (< x 10)) (list -2 3 8 9 11 14))

(@HtDF less-than-10?)
(@signature Integer -> Boolean)
;; produce true if i is less than 10
(check-expect (less-than-10? 11) false)
(check-expect (less-than-10? 10) false)
(check-expect (less-than-10? 9) true)

;(define (less-than-10? i) false) ; stub

(define (less-than-10? i)
  (< i 10))




;;PROBLEM 3: Complete the design of this function that consumes a
;;number x and a list of Numbers and produces list of all the number
;;with x added. Use built-in abstract functions.
(@HtDF add-to-all)
(@signature Number (listof Number) -> (listof Number))
;; produce list that contains of all elements of lon with x added
(check-expect (add-to-all 4 empty) empty)
(check-expect (add-to-all 4 (list 1 2 3.1)) (list 5 6 7.1))

;(define (add-to-all x lon) empty) ;stub

(@template use-abstract-fn)
(define (add-to-all x lon)
  (local [(define (add-x n)`
            (+ n x))]
    (map add-x lon)))

;; Example of Closures.


;; PROBLEM 4: Complete the design of this function that consumes a list of
;; images and a number and produces a list of only images whose area is bigger
;; than the number. Use built-in abstract functions. 
(@HtDF area-bigger-than-only)
(@signature Number (listof Image) -> (listof Image))
;; produce list of only those images in loi with area > a
(check-expect (area-bigger-than-only 20 empty) empty)
(check-expect (area-bigger-than-only 250 LOI1) (list I2 I3 I4 I5))

(define (area-bigger-than-only a loi) empty) ;stub




;;PROBLEM 5: Refactor this function to use built-in abstract functions.
(@HtDF double-all)
(@signature (listof Number) -> (listof Number))
;; produce list that contains every element from lon doubled
(check-expect (double-all empty) empty)
(check-expect (double-all (list 1.1 8 0.2)) (list 2.2 16 0.4))

(@template (listof Number))
(define (double-all lon)
  (cond [(empty? lon) empty]
        [else
         (cons (* 2 (first lon))
               (double-all (rest lon)))]))







;; PROBLEM 6: Complete the design of this function that consumes a Number x
;; and a list of Numbers and produces list of all the positive numbers after x
;; has been subtracted from each element. Use built-in abstract functions.
(@HtDF pos-after-subtract)
(@signature Number (listof Number) -> (listof Number))
;; produce list that contains only positive numbers after x has been subtracted
(check-expect (pos-after-subtract 4 empty) empty)
(check-expect (pos-after-subtract 4 (list 5 9 2 3 10)) (list 1 5 6))

(define (pos-after-subtract x lon) empty) ; stub







