;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lec29-oob-rsf-with-trees-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
;; PROBLEM
;; Complete the design of the all-names function below, try and
;; make it tail recursive using an rsf accumulator.
;;
(@HtDF all-names)
(@signature Tree -> (listof String))
;; produce the names of all nodes in t
(check-expect (all-names L1) (list "L1"))
(check-expect (all-names M2) (list "M2" "L2" "L3"))
(check-expect (all-names TOP) (list "TOP" "M1" "L1" "M2" "L2" "L3"))

;(define (all-names t) empty)

(@template Tree (listof Tree) accumulator)
(define (all-names t0)
  ;; rsf is (listof String): the names of nodes visited so far
  ;; (all-names M2)
  ;;
  ;; (fn-for-t M2 empty)
  ;; (fn-for-lot (list L2 L3) (list (node-name M2)))
  ;; (fn-for-lot L2 (list "M2"))
  ;; (fn-for-lot L3 (list "M2" "L2"))
  ;; (fn-for-t L2 (list "M2" "L2"))
  ;; (fn-for-lot empty (list "L3" "M2" "L2"))
  
  (local [(define (fn-for-t t rsf)
            (fn-for-lot (node-subs t)
                        (append rsf (list (node-name t))))) ; appending so rsf
                                                            ; is not rev. order
 
          (define (fn-for-lot lot rsf)
            (cond [(empty? lot) rsf]
                  [else
                   (append (fn-for-t (first lot) rsf)
                           (fn-for-lot (rest lot) rsf))]))]
    
    (fn-for-t t0 empty)))

;; TODO watch the worklist videos and fix this.
;;      this function is not producing the correct result.
;; TODO work on Problem 2.

;; PROBLEM 2
;; Complete the design of the count-nodes function below
;; making it tail recursive with an rsf and worklist acc.
;;
(@HtDF count-nodes)
(@signature Tree -> Natural)
;; produce a count of the number of nodes in t
(check-expect (count-nodes L1) 1)
(check-expect (count-nodes M2) 3)
(check-expect (count-nodes TOP) 6)


(define (count-nodes t) 0)