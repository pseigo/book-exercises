;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lec20-encapsulation-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require spd/tags)

;;
;; Region and ListOfRegion data definitions provided.
;; 
(@HtDD Region ListOfRegion)
(define-struct terminal (label weight color))
(define-struct group (color subs))

;; Region is one of:
;;  - (make-terminal String Natural Color)
;;  - (make-group Color ListOfRegion)
;; interp.
;;  an arbitrary-arity tree of regions
;;  terminal regions have label, weight and color
;;  groups just have a color and a list of sub-regions
;;
;;  weight is a unitless number indicating how much weight
;;  given terminal contributes to whole tree

;; ListOfRegion is one of:
;;  - empty
;;  - (cons Region ListOfRegion)
;; interp. a list of regions

;; All the Ts and Gs are Regions
(define T1 (make-terminal "tee-one" 20 "red"))
(define T2 (make-terminal "tee-two" 40 "blue"))
(define T3 (make-terminal "tee-three" 60 "orange"))
(define T4 (make-terminal "tee-four" 30 "black"))
(define T5 (make-terminal "tee-five" 50 "purple"))
(define T6 (make-terminal "tee-six" 80 "yellow"))

(define G1 (make-group "red"  (list T1 T2 T3)))
(define G2 (make-group "blue" (list G1 T4)))
(define G3 (make-group "orange" (list T5 T6)))
(define G4 (make-group "black" (list G2 G3)))

(define LORE empty)
(define LOR123 (list T1 T2 T3))

(define (fn-for-region r)
  (local [(define (fn-for-region r)
            (cond [(terminal? r)
                   (... (terminal-label r)
                        (terminal-weight r)
                        (terminal-color r))]
                  [(group? r)
                   (... (terminal-color r)
                        (fn-for-lor (group-subs r)))]))

          (define (fn-for-lor lor)
            (cond [(empty? lor) (...)]
                  [else
                   (... (fn-for-region (first lor))
                        (fn-for-lor (rest lor)))]))]

    (fn-for-region r)))

(@HtDD ListOfString)


;; Problem 1: Encapsulate the total-weight functions into a single function
(@Problem 1)
(@HtDF total-weight)
(@signature Region -> Integer)
;; produce total weight of region / list of region
(check-expect (total-weight T1) 20)
(check-expect (total-weight G4) (+ 20 40 60 30 50 80))

(@template Region ListOfRegion encapsulated)
(define (total-weight r)
  (local [(define (total-weight--region r)
            (cond [(terminal? r) (terminal-weight r)]
                  [(group?    r) (total-weight--lor (group-subs r))]))

          (define (total-weight--lor lor)
            (cond [(empty? lor) 0]
                  [else
                   (+ (total-weight--region (first lor))
                      (total-weight--lor (rest lor)))]))]

    (total-weight--region r)))


;; Problem 2: Encapsulate the find-region functions into a single
;; function

(@Problem 2)
(@HtDF find-region)
(@signature Region String -> Region or false)
;; find region w/ given label

(check-expect (find-region "tee-one" T1) T1)
(check-expect (find-region "tee-one" T2) false)
(check-expect (find-region--region "tee-three" G4) T3)
(check-expect (find-region--region "tee-threed" G4) false)

(@template Region ListOfRegion add-param backtracking encapsulated)
(define (find-region l r)
  (local [(define (find-region--region l r)
            (cond [(terminal? r) (if (string=? (terminal-label r) l) r false)]
                  [(group?    r) (find-region--lor l (group-subs r))]))

          (define (find-region--lor l lor)
            (cond [(empty? lor) false]
                  [else
                   (if (not (false? (find-region--region l (first lor))))
                       (find-region--region l (first lor))
                       (find-region--lor l (rest lor)))]))]

    (find-region--region l r)))




;;PROBLEM 3: Encapsulate the template in the Data Definition above
(@Problem 3)



;; Problem 4: Encapsulate the all-labels functions into a single function.
(@Problem 4)
(@HtDF all-labels--region all-labels--lor)
(@signature Region -> ListOfString)
(@signature ListOfRegion -> ListOfString)
;; produce labels of all regions in region (including root)
(check-expect (all-labels--lor empty) empty)
(check-expect (all-labels--region T1) (list "tee-one"))
(check-expect (all-labels--lor LOR123) (list "tee-one" "tee-two" "tee-three"))
(check-expect (all-labels--region G4)
              (list "tee-one" "tee-two" "tee-three"
                    "tee-four" "tee-five" "tee-six"))

(@template Region)
(define (all-labels--region r)
  (cond [(terminal? r) (list (terminal-label r))]
        [(group?    r) (all-labels--lor (group-subs r))]))

(@template ListOfRegion)
(define (all-labels--lor lor)
  (cond [(empty? lor) empty]
        [else
         (append (all-labels--region (first lor))
                 (all-labels--lor (rest lor)))]))



;; Problem 5: Using the encapsulated template from Problem 3, design a functon
;; that consumes a region and a string and produces a list of all contained
;; regions with the given color. Include the root if it has that color.

(@Problem 5)