;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lec29-oob-trees-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@HtDD Tree)
(define-struct node (name subs))
;; Tree is (make-node String (listof Tree))
;; interp. a bare bones arbitrary arity tree, each node has a name and subs
(define L1 (make-node "L1" empty))
(define L2 (make-node "L2" empty))
(define L3 (make-node "L3" empty))
(define M1 (make-node "M1" (list L1)))
(define M2 (make-node "M2" (list L2 L3)))
(define TOP (make-node "TOP" (list M1 M2)))
#;
(define (fn-for-tree t)  
  (local [(define (fn-for-t t)
            (... (node-name t)
                 (fn-for-lot (node-subs t))))
          
          (define (fn-for-lot lot)
            (cond [(empty? lot) (...)]
                  [else
                   (... (fn-for-t (first lot))
                        (fn-for-lot (rest lot)))]))]    
    (fn-for-t t)))




;;
;; PROBLEM 3
;;
;; Complete the design of the all-paths function below.

;; The first version of your function definition should use a context
;; preserving accumulator to represent the path to the current tree.
;; the path is a list of node names, so the type of the accumulator is
;; (listof String) when you get to a tree with no subs,
;;  just produce the path to there (Friday)
;;
;; The second version should use both a result so far and a worklist
;; accumulator to be tail recursive. (Weekend)
;;
;; The third version should use a compound worklist entry to solve the
;; problems with the second version. (Monday)
;;

(@HtDF all-paths)
(@signature Tree -> (listof (listof String)))
;; produce all the paths of names in the tree
(check-expect (all-paths L1) (list (list "L1")))
(check-expect (all-paths L2) (list (list "L2")))
(check-expect (all-paths M1) (list (list "M1" "L1")))
(check-expect (all-paths M2) (list (list "M2" "L2") (list "M2" "L3")))
(check-expect (all-paths TOP) (list (list "TOP" "M1" "L1")
                                    (list "TOP" "M2" "L2")
                                    (list "TOP" "M2" "L3")))

;(define (all-paths t) empty)    ;stub

(@template Tree (listof Tree) accumulator)
(define (all-paths t0)
  ;; path is (listof String): cpa, path to current tree
  ;; 
  
  (local [(define (fn-for-t t path)
            (if (empty? (node-subs t)) ; concerned about depth
                (list (append path (list (node-name t))))
                (fn-for-lot (node-subs t)
                            (append path (list (node-name t))))))
          
          (define (fn-for-lot lot path) ; concerned about breadth, not depth
            (cond [(empty? lot) empty]
                  [else
                   (append (fn-for-t (first lot) path)
                           (fn-for-lot (rest lot) path))]))]    
    (fn-for-t t0 empty)))


;; Try and blend in an RSF. We want to make a tail recursive function which
;; requires a worklist. Then we'll find it still doesn't work, so we will
;; need a compound worklist.