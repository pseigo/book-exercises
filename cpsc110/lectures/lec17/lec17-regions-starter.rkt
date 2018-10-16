;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lec17-regions-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

;; ** ADD TEMPLATE **

(@dd-template-rules one-of
                    compound
                    compound
                    ref)
(define (fn-for-region r)
  (cond [(terminal? r)
         (... (terminal-label r)
              (terminal-weight r)
              (terminal-color r))]
        [(group? r)
         (... (group-color r)
              (fn-for-lor (group-subs r)))]))

(@dd-template-rules one-of
                    atomic-distinct
                    compound
                    ref
                    self-ref)
(define (fn-for-lor lor)
  (cond [(empty? lor) (...)]
        [else
         (... (fn-for-region (first lor))
              (fn-for-lof (rest lor)))]))


;; Problem 1: Design a function that produces the total
;; weight of a region / list of region

(@Problem 1)
(@HtDF total-weight--region total-weight--lor)
(@signature Region -> Integer)
(@signature ListOfRegion -> Integer)
;; produce total weight of region / list of region

;; ** ADD TESTS **
(check-expect (total--weight--lor empty) 0)  ; base case, empty list
(check-expect (total--weight--region T1) 20) ; base case, one region
(check-expect (total--weight--lor (make-group "BAT" empty)) 0) ; no subnodes
(check-expect (total--weight--lor LOR123) (+ 20 40 60))
(check-expect (total--weight--region G1) 120)
(check-expect (total--weight--region G1)
              (total--weight--lor LOR123))
(check-expect (total--weight--region G1)
              (total--weight--lor (group-subs G1)))


(define (total-weight--region r) 0) ; stub
(define (total-weight--lor lor) 0)  ; stub


;; ** ADD TEMPLATE TAG, COPY TEMPLATES COMPLETE FUNCTION DESIGN **
(@template Region)
(define (total--weight--region r)
  (cond [(terminal? r)
         (terminal-weight r))]
        [(group? r)
         (total--weight--region (group-subs r)))]))

(@template ListOfRegion)
(define (total--weight--lor lor)
  (cond [(empty? lor) 0]
        [else
         (+ (total--weight--region (first lor)) ; the weights for left branch
            (total--weight--lor (rest lor)))])) ; the weights for other branches


;; Problem 2: Design a function that consumes a region and
;; produces a list of all the labels in the region.

;; Problem 3: Design a function that consumes a region and a string
;; and produces a list of all contained regions with the given color.
;; Include the root if it has that color.

;; Problem 4: Design a function that consumes a region and a string
;; and looks for a region with the given label.  If there is one
;; the function should produce the first one it finds.  If there is
;; not one it should produce false.  The signature for the function
;; is given below

;; Problem 5: Design a function that renders a region and
;; its subregions. The rendering does not have to be pretty,
;; but it must somehow reflect the coloring, the labels
;; and the weights.