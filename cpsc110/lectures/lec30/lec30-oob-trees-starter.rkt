;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lec30-oob-trees-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; Tail recursive template:
#;
(define (fn-for-tree t)
  ;; acc is ...
  ;; todo is ...
  (local [(define (fn-for-t t todo acc)
            ;(... (node-name t)
            (fn-for-lot (append (node-subs t) todo)
                        (... acc)))
          
          (define (fn-for-lot todo acc)
            (cond [(empty? todo) (... acc)]
                  [else
                   (fn-for-t (first todo) (rest todo) (... acc))]))]
    ;(... (fn-for-t (first lot))
    ;     (fn-for-lot (rest lot)))]))]    
    (fn-for-t t ... ...)))



;; PROBLEM
;; Complete the design of the all-names function below.
;; the function must be tail recursive

;;
;(@HtDF all-names)
;(@signature Tree -> (listof String))
;;; produce the names of all leaf nodes (nodes without children) in t
;(check-expect (all-names L1) (list "L1"))
;(check-expect (all-names M2) (list "M2" "L2" "L3"))
;(check-expect (all-names TOP) (list "TOP" "M1" "L1" "M2" "L2" "L3"))
;
;;(define (all-names t) empty)   ;stub
;
;(define (all-names t)
;  ;; rsf is (listof String) - the names of nodes visited thus far
;  ;; todo is (listof Tree) - the trees we still need to visit
;  ;; (all-names M2)
;
;  ;; (fn-for-t M2 empty)
;  ;; (fn-for-lot (list L2 L3) (list "M2"))
;  ;; (fn-for-t L2 (list "M2")
;  ;; (fn-for-lot (list L3) (list "M2" "L2"))
;  ;; (fn-for-t L3 (list "M2" "L2"))
;  ;; (fn-for-lot empty (list "M2 "L2" "L3"))
;  (local [(define (fn-for-t t todo rsf)
;            (fn-for-lot (append (node-subs t) todo)
;                        (append rsf (list (node-name t)))))
;          
;          (define (fn-for-lot lot todo rsf)
;            (cond [(empty? lot) (... todo rsf)]
;                  [else
;                    (fn-for-t (first lot) rsf)]))]
;    
;    (fn-for-t t empty empty)))

;; unfinished ^ ^ ^


;;
;; PROBLEM
;;
;; Complete the design of the all-paths function below.
;;
;; The first version of your function definition should use a context
;; preserving accumulator to represent the path to the current tree.
;;
;; The second version should use both a result so far and a worklist
;; accumulator to be tail recursive.
;;
;; The third version should use a compound worklist entry to solve the
;; problems with the second version.
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


(@template Tree (listof Tree) accumulator)
;; Structural recursion with path accumulator. Works properly.
#;
(define (all-paths t)
  ;; path is (listof String); name of parent, grandparent... of current tree
  (local [(define (fn-for-t t path)
            (local [(define n+path (append path (list (node-name t))))]
              (if (empty? (node-subs t))
                  (list n+path)
                  (fn-for-lot (node-subs t)
                              n+path))))
          
          (define (fn-for-lot lot path)
            (cond [(empty? lot) empty]
                  [else
                   (append (fn-for-t (first lot) path)
                           (fn-for-lot (rest lot) path))]))]
    
    (fn-for-t t empty)))


(@template Tree (listof Tree) accumulator)
;; Attempt at tail recursion with an rsf and cpa
;; Works properly but isn't tail recursive

(define (all-paths t)
  ;; path is (listof String); name of parent, grandparent... of current tree
  ;; rsf is (listof (listof String)); list of complete paths so far
  ;; todo is (listof Tree); the trees we still have to visit
  (local [(define (fn-for-t t todo path rsf)
            (local [(define n+path (append path (list (node-name t))))]
              (if (empty? (node-subs t))
                  (fn-for-lot todo n+path
                              (append rsf (list n+path)))
                  (fn-for-lot (append (node-subs t) todo)
                              n+path rsf))))
          
          (define (fn-for-lot lot todo path rsf)
            (cond [(empty? lot) rsf]
                  [else
                   (fn-for-lot (first todo) (rest todo) path rsf)]))]
    
    (fn-for-t t empty empty)))

;; incomplete

