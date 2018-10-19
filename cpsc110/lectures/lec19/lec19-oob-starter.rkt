;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lec19-oob-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
;;=================
;; Data Definitions:
(@HtDD ListOfNumber)
;; ListOfNumber is one of:
;; - empty
;; - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON0 empty)
(define LON1 (cons 10 (cons -3.2 empty)))

(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))


;;PROBLEM 1:
;;Design a function that consumes two lists of numbers and produces true if the
;;numbers in the first list are contained in the second list, in the same
;;order that they appear in the first list. Note: this means
;;that numbers that don't match are allowed in between numbers that do match.
;;
;;For example: (contains? (list 1 4) (list 5 1 4)) would produce true
;;      and    (contains? (list 1 4) (list 1 6 4)) would produce true
;;      but    (contains? (list 1 4) (list 1 5 6)) would produce false
;;      and    (contains? (list 1 4) (list 4 1))   would produce false
      

(@Problem 1)
(@HtDF contains?)
(@signature ListOfNumber ListOfNumber -> Boolean)
;; produce true if lon2 contains all numbers from lon1 in the same order
(check-expect (contains? empty empty) true)
(check-expect (contains? empty (list 1)) true)
(check-expect (contains? (list 1) empty) false)
(check-expect (contains? (list 1) (list 1)) true)
(check-expect (contains? (list 1) (list 1 2)) true)
(check-expect (contains? (list 2) (list 1 2)) true)
(check-expect (contains? (list 3) (list 1 2)) false)
(check-expect (contains? (list 1 2) (list 1 2)) true)
(check-expect (contains? (list 2 1) (list 1 2)) false)
(check-expect (contains? (list 1 2) (list 1 2 3)) true)
(check-expect (contains? (list 1 3) (list 1 2 3)) true)
(check-expect (contains? (list 1 2 3 4) (list 1 2 3)) false)
(check-expect (contains? (list 2 3) (list 1 2 3)) true)
(check-expect (contains? (list 3 2) (list 1 2 3)) false)
;; testing different sizes, one too big, same size, smaller, and ordering

;(define (contains? lon1 lon2) false) ; stub

(@template 2-one-of)
(define (contains? lon1 lon2)
  (cond [(empty? lon1) true]   ; 1
        [(empty? lon2) false]  ; 2
        [else
         (if (= (first lon1) (first lon2))
             (contains? (rest lon1)
                        (rest lon2))
             (contains? lon1
                        (rest lon2)))]))


(@HtDD BinaryTree)
(define-struct node (k v l r))
;; BinaryTree is one of:
;;  - false
;;  - (make-node Natural String BinaryTree BinaryTree)
;; interp. 
;;  a binary tree, each node has a key, value and l/r children

(define BT0 false)
(define BT1 (make-node 1 "a" false false))
(define BT4 (make-node 4 "d"
                       (make-node 2 "b"
                                  (make-node 1 "a" false false)
                                  (make-node 3 "c" false false))
                       (make-node 5 "e" false false)))

(@HtDD Path)
;; Path is one of:
;; - empty
;; - (cons "L" Path)
;; - (cons "R" Path)
;; interp. 
;;  A sequence of left and right 'turns' down through a BinaryTree
;;  (list "L" "R" "R") means take the left child of the tree, then
;;  the right child of that subtree, and the right child again.
;;  empty means you have arrived at the destination.

(define P1 empty)
(define P2 (list "L"))
(define P3 (list "R"))
(define P4 (list "L" "R"))

;;PROBLEM:
;;
;;Design the function has-path? that consumes BinaryTree and Path.
;;The function should produce true if following the path through the
;;tree leads to a node. If the path leads to false, or runs into false
;;before reaching the end of the path the function should produce false. 
;;Show the cross product of type comments table, the simplification,
;;and the correspondence between table cells and cond cases.


(@Problem 2)
(@HtDF has-path?)
(@signature BinaryTree Path -> Boolean)
;; produce true if following p through bt leads to a node, not false
;; !!!
; always true and always false cases
(check-expect (has-path? false empty) true)
(check-expect (has-path? false P2) false)
(check-expect (has-path? false P3) false)
(check-expect (has-path? BT1 empty) true)
(check-expect (has-path? BT4 empty) true)

; variable cases
(check-expect (has-path? BT4 P2) )

;(define (has-path? bt p) false) ; stub

(@template 2-one-of)
(define (has-path? bt p)
  (cond []
        []
        [] ; if first is an L
        [])) ; if first is an R


;; FINISH THIS
  



