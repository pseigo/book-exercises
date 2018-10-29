;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lec23-oob-1-builtin-abstractfns-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)




;; PROBLEM 7: Complete the design of this function. Use built-in abstract fns.
(@HtDF list-starting-at)
(@signature Natural Natural -> (listof String))
;; produce list of n increasing values, starting at x, converted to a string
(check-expect (list-starting-at 0 4) empty)
(check-expect (list-starting-at 3 5) (list "5" "6" "7"))
(check-expect (list-starting-at 6 2) (list "2" "3" "4" "5" "6" "7"))

;(define (list-starting-at n x) empty) ;stub

(@template use-abstract-fn fn-composition add-param)
(define (list-starting-at n x)
  (local [(define (shift n) (+ n x))]
    (map number->string (build-list n shift))))



;; PROBLEM 8: Complete the design of this function. Use built-in abstract fns.
(@HtDF n-circles)
(@signature Natural -> Image)
;; produce n circles horizontally, 1st radius 10 pixels, each grows 10 pixels
(check-expect (n-circles 0) empty-image)
(check-expect (n-circles 3) (beside (circle 10 "outline" "black")
                                    (circle 20 "outline" "black")
                                    (circle 30 "outline" "black")))

;(define (n-circles n) empty-image)  ;stub

(@template use-abstract-fn fn-composition)
(define (n-circles n)
  (local [(define (make-circle e)
            (circle (* 10 (add1 e)) "outline" "black"))]
    (foldr beside empty-image (build-list n make-circle))))

; 1. build-list of circles
; 2. foldr: reduce circles to a single image [using beside]

;; PROBLEM 9: Complete the design of this function. Use built-in abstract fns.
(@HtDF count)
(@signature (listof Number) -> Natural)
;; produce a count of the number of elements in lon
(check-expect (count empty) 0)
(check-expect (count (list 3 5 7 8 9)) 5)

(define (count lon) empty) ;stub







;; PROBLEM 10: Complete the design of this function using built-in abstract fns
(@HtDF acronym)
(@signature (listof String) -> String)
;; produce String with the first letter from every element in los
;; ASSUME: no elements in los are the empty string
(check-expect (acronym empty) "")
(check-expect (acronym (list "abc" "def" "ghi")) "adg")

(define (acronym los) empty) ;stub





;; PROBLEM 11: Complete the design of this function using built-in abstract fns
(@HtDF sum>x)
(@signature Natural (listof Natural) -> Natural)
;; produce the sum of all numbers in lon greater than x
(check-expect (sum>x 5 empty) 0)
(check-expect (sum>x 5 (list 3 4 5 6 7)) (+ 6 7))
(check-expect (sum>x 3 (list 2 3 4 5 6)) (+ 4 5 6))

(define (sum>x x lon) empty) ;stub







;; PROBLEM 12: Refactor this function to use built-in abstract functions
(@HtDF all-positive?)
(@signature (listof Integer) -> Boolean)
;; produce true if all elements in lon are positive, false otherwise
(check-expect (all-positive? empty) true)
(check-expect (all-positive? (list 2 3 -8 9 -11 -14)) false)
(check-expect (all-positive? (list 2 3 9 11 4)) true)

(@template (listof Integer))
(define (all-positive? loi)
  (cond [(empty? loi) true]
        [else
         (and (positive? (first loi))
              (all-positive? (rest loi)))]))






;; PROBLEM 13: Refactor this function to use built-in abstract functions
(@HtDF words-longer-than-x)
(@signature Natural (listof String) -> Natural)
;; produce a count of the number of words in los with more than x letters
(check-expect (words-longer-than-x 3 empty) 0)
(check-expect (words-longer-than-x 3 (list "hi" "cpsc" "110" "students")) 2)
(check-expect (words-longer-than-x 5 (list "some" "lengthy" "words")) 1)

;(define (words-longer-than-x x los) empty) ;stub

(@template (listof String) String encapsulated add-param)
(define (words-longer-than-x x los)
  (local [(define (longer? s)
            (> (string-length s) x))

          (define (fn-for-los los)
            (cond [(empty? los) 0]
                  [else
                   (if (longer? (first los))
                       (+ 1 (fn-for-los (rest los)))
                       (fn-for-los (rest los)))]))]
    (fn-for-los los)))




;; USE THE FOLLOWING DATA DEFINITION TO COMPLETE PROBLEMS 14 - 16
;;
(@HtDD Dog)
(define-struct dog (br int))
;; Dog is (make-dog String Natural)
;; interp. a dog that is breed and intelligence rating between 1 and 10,
;;         where 1 is high and 10 is low
(define D1 (make-dog "Border Collie" 1))
(define D5 (make-dog "Doberman Pinscher" 5))
(define D10 (make-dog "Austrailian Cattle Dog" 10))

(define (fn-for-dog d)
  (... (dog-br d)
       (dog-int d)))

;; PROBLEM 14: Complete the design of the function using built-in abstract fns 
(@HtDF over-avg-intelligence)
(@signature (listof Dog) -> (listof String))
;; produce a list of dog breeds that have intelligence less than 5
(check-expect (over-avg-intelligence empty) empty)
(check-expect (over-avg-intelligence (list D1 D5 D10)) (list "Border Collie"))

(define (over-avg-intelligence lod) empty) ;stub









;; PROBLEM 15: Complete the design of the function using built-in abstract fns
(@HtDF count-high-intelligence)
(@signature (listof Dog) -> Natural)
;; produce a count of the number of dogs that have intelligence greater than 5
(check-expect (count-high-intelligence empty) 0)
(check-expect (count-high-intelligence (list D1 D5 D10)) 1)

(define (count-high-intelligence lod) 0) ;stub









;; PROBLEM 16: Complete the design of the function using built-in abstract fns
(@HtDF contains-breed?)
(@signature (listof Dog) String -> Boolean)
;; produce true if the list of dogs contains a dog with breed b
(check-expect (contains-breed? "Doberman Pibscher" empty) false)
(check-expect (contains-breed? "Doberman Pinscher" (list D1 D5 D10)) true)
(check-expect (contains-breed? "Golden Retriever" (list D1 D5 D10)) false)

(define (contains-breed? lod b) 0) ;stub


