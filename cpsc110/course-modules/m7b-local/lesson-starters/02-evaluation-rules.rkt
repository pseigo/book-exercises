;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 02-evaluation-rules) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

(define b 1)

;; Step-by-step evaluation of a local exp.

(+ b
   (local [(define b 2)]
     (* b b))
   b)

(+ 1
   (local [(define b 2)]
     (* b b))
   b)

;; Three steps happen at once here:

;; Begin evaluating local
;; Step 1: Renaming
(+ 1
   (local [(define b_0 2)]
     (* b_0 b_0))
   b)

;; Step 2: Lifting
(define b_0 2)

(+ 1
   (local []
     (* b_0 b_0))
   b)

;; Step 3: Replace local with its renamed body
(define b_0 2)

(+ 1
   (* b_0 b_0)
   b)
;; Finish evaluating local

(+ 1
   (* 2 b_0)
   b)

(+ 1
   (* 2 2)
   b)

(+ 1
   4
   b)

(+ 1
   4
   1)

6