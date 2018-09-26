;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 01-list-mechanisms) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)

empty ; an empty list of any type of value


; a list with "Flames" prepended to an empty list, a list of one element
(define L1 (cons "Flames" empty))

;; expressions that produce lists can be formed out of non-value expressions
(define L2 (cons (string-append "C" "anucks") empty))

;; a list of 3 elements
(define L3 (cons 10 (cons 9 (cons 10 empty))))

;; a list of 2 elements
(define L4 (cons (square 10 "solid" "blue")
                 (cons (triangle 20 "solid" "green")
                       empty)))


(first L1)
(rest L3)

;; second element of L3: pop first element, then get first of new list
(first (rest L3))

;; third element of L3
(first (rest (rest L3)))

(empty? empty)
(length L4)