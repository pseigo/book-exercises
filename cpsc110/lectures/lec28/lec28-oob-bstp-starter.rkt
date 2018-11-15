;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lec28-oob-bstp-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
;;
;; PROBLEM:
;;
;; Given the following data definition for binary trees, design a function that
;; consumes a binary tree and produces true if the invariants for the tree being
;; a binary search tree are satisfied.
;; Assume key values range from [0 to 500].
;;

(@HtDD BinaryTree) 

(define-struct node (k v l r))
;; BinaryTree is one of:
;;  - false
;;  - (make-node Integer String BinaryTree BinaryTree)
;; interp.
;;   a binary tree where each node as a key, value and two sub-nodes


(define BT1 (make-node 100 "a"
                       (make-node 50 "b"
                                  (make-node 25 "c"
                                             (make-node 10 "d" false false)
                                             (make-node 30 "e" false false))
                                  (make-node 75 "c"
                                             (make-node 60 "d" false false)
                                             (make-node 80 "e" false false)))
                       (make-node 200 "f" false false)))

(define BT2 (make-node 100 "a"   ;violates left branch rule
                       (make-node 50 "b"
                                  (make-node 51 "c"
                                             (make-node 10 "d" false false)
                                             (make-node 30 "e" false false))
                                  (make-node 75 "c"
                                             (make-node 60 "d" false false)
                                             (make-node 80 "e" false false)))
                       (make-node 200 "f" false false)))

(define BT3 (make-node 100 "a"   ;violates right branch rule
                       (make-node 50 "b"
                                  (make-node 25 "c"
                                             (make-node 10 "d" false false)
                                             (make-node 30 "e" false false))
                                  (make-node 49 "c"
                                             (make-node 60 "d" false false)
                                             (make-node 80 "e" false false)))
                       (make-node 200 "f" false false)))

(define BT4 (make-node 100 "a"
                       (make-node 50 "b"
                                  (make-node 25 "c"
                                             (make-node 10 "d" false false)
                                             (make-node 30 "e" false false))
                                  (make-node 101 "c"
                                             (make-node 60 "d" false false)
                                             (make-node 80 "e" false false)))
                       (make-node 200 "f" false false)))


(define (fn-for-bst bt)
  (cond [(false? bt) (...)]
        [else
         (... (node-k bt)
              (node-v bt)
              (fn-for-bst (node-l bt))
              (fn-for-bst (node-r bt)))]))


(@HtDF bst?) 
(@signature BinaryTree -> Boolean)
;; produce true if bt is a binary SEARCH tree
(check-expect (bst? BT1) true)
(check-expect (bst? BT2) false)
(check-expect (bst? BT3) false)
(check-expect (bst? BT4) false)

;(define (bst? bt) false) ; stub

(@template BinaryTree accumulator)
(define (bst? bt0)
  ;; lower: Natural; lower bound of key at this node (based on parents)
  ;; upper: Natural; upper bound of key at this node (based on parents)
  (local [(define (fn-for-bst bt lower upper)
            (cond [(false? bt) true]
                  [else
                   (and (< lower (node-k bt) upper)
                        (fn-for-bst (node-l bt) lower (node-k bt))
                        (fn-for-bst (node-r bt) (node-k bt) upper))]))]

    (fn-for-bst bt0 0 +inf.0)))