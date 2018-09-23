;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 01-define-struct) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

;; (define-struct structure-name (field names))

(define-struct pos (x y))


;; using the constructor

(define P1 (make-pos 3 6)) ; pos structure
(define P2 (make-pos 2 8))


;; selectors

(pos-x P1) ; 3
(pos-y P2) ; 8


;; predicate
(pos? P1)      ; true
(pos? "hello") ; false