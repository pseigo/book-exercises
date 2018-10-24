;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lec18-regions-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
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

(@dd-template-rules one-of compound compound ref)
(define (fn-for-region r)
  (cond [(terminal? r)
         (... (terminal-label r)
              (terminal-weight r)
              (terminal-color r))]
        [(group? r)
         (... (terminal-color r)
              (fn-for-lor (group-subs r)))]))

(@dd-template-rules one-of atomic-distinct compound ref self-ref)
(define (fn-for-lor lor)
  (cond [(empty? lor) (...)]
        [else
         (... (fn-for-region (first lor))
              (fn-for-lor (rest lor)))]))



(@HtDD ListOfString)

;; Problem 1: Design a function that produces the total
;; weight of a region / list of region

(@Problem 1)
(@HtDF total-weight--region total-weight--lor)
(@signature Region -> Integer)
(@signature ListOfRegion -> Integer)
;; produce total weight of region / list of region
(check-expect (total-weight--lor empty) 0)
(check-expect (total-weight--region T1) 20)
(check-expect (total-weight--lor LOR123) (+ 20 40 60))
(check-expect (total-weight--region (make-group "green" empty)) 0)
(check-expect (total-weight--region G4) (+ 20 40 60 30 50 80))

;; the tests below are for G1 and G4 but written in a different manner
;; do not include the same test written in a different form
;; in your problem sets

(check-expect (total-weight--region G1) 120)
(check-expect (total-weight--region G1) (total-weight--lor LOR123))
(check-expect (total-weight--region G1) (total-weight--lor (group-subs G1)))
(check-expect (total-weight--region G4) (total-weight--lor (list G2 G3)))
(check-expect (total-weight--region G4) (total-weight--lor (group-subs G4)))


(@template Region)
(define (total-weight--region r)
  (cond [(terminal? r) (terminal-weight r)]
        [(group?    r) (total-weight--lor (group-subs r))]))

(@template ListOfRegion)
(define (total-weight--lor lor)
  (cond [(empty? lor) 0]
        [else
         (+ (total-weight--region (first lor))
            (total-weight--lor (rest lor)))]))



;; Problem 2: Design a function that consumes a region and
;; produces a list of all the labels in the region.

;(@Problem 2)
;(@signature Region -> ListOfString)




;; Problem 3: Design a function that consumes a region and a string
;; and produces a list of all contained regions with the given color.
;; Include the root if it has that color.

(@HtDF all-with-color--region all-with-color--lor)
(@signature String Region -> ListOfRegion)
(@signature String ListOfRegion -> ListOfRegion)
;; produce all regions with given color
(check-expect (all-with-color--lor "red" empty) empty)
(check-expect (all-with-color--region "red" T1) (list T1))
(check-expect (all-with-color--region "blue" T1) empty)
(check-expect (all-with-color--lor "blue" LOR123) (list T2))
(check-expect (all-with-color--region "blue" G4)
              (list G2 T2))

;(define (all-with-color--region c r ) r) ; stubs
;(define (all-with-color--lor c lor) lor)

(@template Region)
(define (all-with-color--region c r)
  (cond [(terminal? r)
         (if (string=? (terminal-color r) c)
             (list T1)
             empty)]
        [(group? r)
         (if (string=? (terminal-color r) c)
             (cons r (all-with-color--lor c (group-subs r)))
             (all-with-color--lor c (group-subs r)))]))

(@template ListOfRegion)
(define (all-with-color--lor c lor)
  (cond [(empty? lor) empty]
        [else
         (append (all-with-color--region c (first lor))
                 (all-with-color--lor c (rest lor)))]))




;; Problem 4: Design a function that consumes a region and a string
;; and looks for a region with the given label.  If there is one
;; the function should produce the first one it finds.  If there is
;; not one it should produce false.  The signature for the function
;; is given below


(@HtDF find-region--region find-region--lor)
(@signature String Region -> Region or false)
(@signature String ListOfRegion -> Region or false)
;; find region w/ given label
(check-expect (find-region--lor "tee-one" empty) false)
(check-expect (find-region--region "tee-one" T1) T1)
(check-expect (find-region--region "tee-one" T2) false)
(check-expect (find-region--region "tee-two" LOR123) T2)
(check-expect (find-region--region "tee-three" G4) T3)

;(define (find-region--region s r) false) ; stubs
;(define (find-region--lor s lor) false)

(@template Region add-param)
(define (find-region--region l r)
  (cond [(terminal? l r)
         (if (string=? (terminal-label r) l)
             r
             false)]
        [(group? r)
         (find-region--lor l (group-subs r))]))

(@template ListOfRegion add-param)
(define (find-region--lor l lor)
  (cond [(empty? lor) false]
        [else
         (if (not (false? (find-region--region l (first lor))))
                  (find-region--region l (first lor))
                  (find-region--lor l (rest lor)))]))





;; Problem 5: Design a function that renders a region and its subregions as
;; nested boxes. The rendering does not have to be pretty, but it must somehow
;; reflect the coloring, the labels and the weights.  The border function below
;; may be helpful to you. 



(define BORDER-THICKNESS 5)

(@HtDF border)
(@signature Color Image -> Image)
;; add a border of the given color around img
(check-expect (border "red" (rectangle 50 100 "solid" "blue"))
              (overlay (rectangle 50 100 "solid" "blue")
                       (rectangle 50 100 "solid" "white")
                       (rectangle (+ 50 BORDER-THICKNESS)
                                  (+ 100 BORDER-THICKNESS)
                                  "solid"
                                  "red")))
(check-expect (border "orange" (rectangle 60 70 "solid" "blue"))
              (overlay (rectangle 60 70 "solid" "blue")
                       (rectangle 60 70 "solid" "white")
                       (rectangle (+ 60 BORDER-THICKNESS)
                                  (+ 70 BORDER-THICKNESS)
                                  "solid"
                                  "orange")))

(define (border c img)
  (overlay img
           (rectangle (image-width img)
                      (image-height img)
                      "solid"
                      "white")
           (rectangle (+ (image-width img) BORDER-THICKNESS)
                      (+ (image-height img) BORDER-THICKNESS)
                      "solid"
                      c)))










