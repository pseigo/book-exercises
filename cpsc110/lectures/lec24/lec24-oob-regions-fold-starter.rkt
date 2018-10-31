;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lec24-oob-regions-fold-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require spd/tags)

;;
;; Region data definition provided. 
;; 
(@HtDD Region)
(define-struct single (label weight color))
(define-struct group (color subs))
;; Region is one of:
;;  - (make-single String Natural Color)
;;  - (make-group Color (listof Region)
;; interp.
;;  an arbitrary-arity tree of regions
;;  single regions have label, weight and color
;;  groups just have a color and a list of sub-regions
;;
;;  weight is a unitless number indicating how much weight
;;  given single contributes to whole tree


;; All the Ss and Gs are Regions
(define S1 (make-single "sss-one" 20 "red"))
(define S2 (make-single "sss-two" 40 "blue"))
(define S3 (make-single "sss-three" 60 "orange"))
(define S4 (make-single "sss-four" 30 "black"))
(define S5 (make-single "sss-five" 50 "purple"))
(define S6 (make-single "sss-six" 80 "yellow"))

(define G1 (make-group "red"  (list S1 S2 S3)))
(define G2 (make-group "blue" (list G1 S4)))
(define G3 (make-group "orange" (list S5 S6)))
(define G4 (make-group "black" (list G2 G3)))

(define LORE empty)
(define LOR123 (list S1 S2 S3))

(define (fn-for-region r)
  (cond [(single? r)
         (... (single-label r)
              (single-weight r)
              (single-color r))]
        [(group? r)
         (... (group-color r)
              (fn-for-lor (group-subs r)))]))

(define (fn-for-lor lor)
  (cond [(empty? lor) (...)]
        [else
         (... (fn-for-region (first lor))
              (fn-for-lor (rest lor)))]))

;; Design an abstract fold function for Region.
(@Problem 1)



#;#;
(define (fn-for-region r)
  (cond [(single? r)
         (... (single-label r)
              (single-weight r)
              (single-color r))]
        [(group? r)
         (... (group-color r)
              (fn-for-lor (group-subs r)))]))

(define (fn-for-lor lor)
  (cond [(empty? lor) (...)]
        [else
         (... (fn-for-region (first lor))
              (fn-for-lor (rest lor)))]))

(@HtDF fold-region)
(@signature (String Natural Color -> X) (Color Y -> X) (X Y -> Y) Y Region -> X)
;; produce the abstract fold function for Region

(check-expect (fold-region make-single make-group cons empty S1) S1)
(check-expect (fold-region make-single make-group cons empty G4) G4)

(@template Region (listof Region) encapsulated add-param)
(define (fold-region c1 c2 c3 b1 r)
  (local [(define (fn-for-region r)
            (cond [(single? r) ; -> X
                   (c1 (single-label r)   ; -> String
                       (single-weight r)  ; -> Natural
                       (single-color r))] ; -> Color
                  [(group? r)
                   (c2 (group-color r) ; -> Color
                       (fn-for-lor (group-subs r)))])) ; -> Y

          (define (fn-for-lor lor) ; -> Y
            (cond [(empty? lor) b1]
                  [else
                   (c3 (fn-for-region (first lor))  ; -> X
                       (fn-for-lor (rest lor)))]))] ; -> Y

    (fn-for-region r))) ; -> X

     

;; Complete the design of the following function.  Your function definition
;; must call fold-region.
(@Problem 2)

(@HtDF total-weight)
(@signature Region -> Integer)
;; produce total weight of region and all sub-regions
(check-expect (total-weight S1) 20)
(check-expect (total-weight G4) (+ 20 40 60 30 50 80))

;(define (total-weight r) 0)

(@template use-abstract-fn)
(define (total-weight r)
  (local [(define (c1 label weight color) weight)
          (define (c2 c rmr) rmr)]
    
    (fold-region c1 c2 + 0 r)))


;; Complete the design of the following function.  Your function definition
;; must call fold-region.
(@Problem 3) 

(@HtDF all-labels)
(@signature Region -> (listof String))
;; produce labels of all regions in region (including root)
(check-expect (all-labels S1) (list "sss-one"))
(check-expect (all-labels G4)
              (list "sss-one" "sss-two" "sss-three"
                    "sss-four" "sss-five" "sss-six"))

;(define (all-labels r) empty) ;stub

(@template use-abstract-fn)
(define (all-labels r)
  (local [(define (c1 label weight color) (list label))
          (define (c2 color rmr) rmr)] ; result [of] mutual recursion = rmr

    (fold-region c1 c2 append empty r)))




;; Design a function that renders a region and its subregions as nested boxes.
;; The rendering does not have to be pretty, but it must somehow reflect the
;; coloring, the labels and the weights.  There is a useful function called
;; border below
(@Problem 4)
(@HtDF render)
(@signature Region -> Image)
;; produce simple nested rendering of region

;; make a plan before doing this !! :^)
;(check-expect (render S1)
;               (beside (border (single-color S1)
;                               (text (single-label S1) 24 (single-color S1)))
;                       empty-image))
;
;(check-expect (render G3)
;              (border (group-color G3)
;                      (beside (text (single-label S5) 24 "black")
;                              (text (single-label S6) 24 "black")
;                              empty-image)
;                      empty-image))


(define (render r) empty-image)  ;stub















(define BORDER-THICKNESS 10)
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
           









;; Design a function that consumes a region and a string and produces a list
;; of all contained regions with the given color. Include the root if it has
;; that color.
;;
;; Is fold-region useful for this function?  If so, complete the design that
;; calling fold-region.  If not explain exactly why.
(@Problem 5)

(@HtDF all-with-color)
(@signature Color Region -> (listof Region))
;; !!!
(define (all-with-color c r) empty)

(@Problem 6)
;; Design a function that consumes a region and a string and looks for a region
;; with the given label.  If there is one the function should produce the weight
;; of the first one it finds.  If there is not one it should produce false. 
;;
;; Is fold-region useful for this function?  If so, complete the design that
;; using fold-region.  If not explain exactly why.
;;
(@HtDF find-weight)
(@signature String Region -> Natural or false)
;; produce weight of first region with given label; or false if none
;; !!!
(define (find-weight s r) 0)
