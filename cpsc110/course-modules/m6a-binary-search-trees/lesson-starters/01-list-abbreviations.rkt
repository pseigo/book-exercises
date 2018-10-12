;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 01-list-abbreviations) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; list notation vs. cons notation
(cons "a" (cons "b" (cons "c" empty)))
(list "a" "b" "c")


(define L1 (list 1 2 3))
(define L2 (list 4 5 6))
(define L3 (list 7 8))

;; append 2 or more lists to each other
(append L1 L2 L3)
;> (list 1 2 3 4 5 6 7 8)

;; construct a list by appending multiple items to a list
(list* -4 -3 -2 -1 0 L1)
;> (list -4 -3 -2 -1 0 1 2 3)

;; extracts the indexed item from the list
(list-ref L1 0)
;> 1

;; constructs a list of i copies of x
(make-list 3 "foobar")
;> (list "foobar" "foobar" "foobar")
;> (cons "foobar" (cons "foobar" (cons "foobar" empty)))

