;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname lec23-oob-2-region-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
              (fn-for-lor (rest lor)))]))

(@HtDD ListOfString)


;; Problem 1: Refactor the following functions where possible using built-in
;;            abstract functions.
(@Problem 1)
(@HtDF total-weight)
(@signature Region -> Integer)
;; produce total weight of region / list of region
(check-expect (total-weight T1) 20)
(check-expect (total-weight G4) (+ 20 40 60 30 50 80))

;; We cannot refactor total-weight--region because the built-in abstract
;; functions all take either a natural or a list.
(@template Region ListOfRegion encapsulated)
(define (total-weight r)
  (local [(define (total-weight--region r)
            (cond [(terminal? r) (terminal-weight r)]
                  [(group?    r) (total-weight--lor (group-subs r))]))

          ;; ListOfRegion. "LIST". We CAN use built-in abstract functions.
          ;; We can't add regions together, so we first map each region to a
          ;; number.
          (define (total-weight--lor lor)
            (foldr + 0 (map total-weight--region lor)))]
    
    (total-weight--region r)))   ; trampoline


;; Problem 2: Refactor the following functions where possible using built-in
;;            abstract functions.
(@Problem 2)
(@HtDF all-labels)
(@signature Region -> (listof String))
;; produce labels of all regions in region (including root)
(check-expect (all-labels T1) (list "tee-one"))
(check-expect (all-labels G4)
              (list "tee-one" "tee-two" "tee-three"
                    "tee-four" "tee-five" "tee-six"))

(@template Region ListOfRegion encapsulated)
(define (all-labels r)
  (local [(define (all-labels--region r)
            (cond [(terminal? r) (list (terminal-label r))]
                  [(group?    r) (all-labels--lor (group-subs r))]))
         
          (define (all-labels--lor lor)
            (foldr append empty (map all-labels--region lor)))]
    
    (all-labels--region r)))


;; Problem 3: Refactor the following functions where possible using built-in
;;            abstract functions.

(@Problem 3)
(@HtDF all-with-color)
(@signature String Region -> (listof Region))

;; produce all regions with given color
(check-expect (all-with-color "red" T1) (list T1))
(check-expect (all-with-color "blue" T1) empty)
(check-expect (all-with-color "red"
                              (make-group "blue"
                                          (list G4
                                                (make-terminal "X" 90 "red"))))
              (list G1 T1 (make-terminal "X" 90 "red")))


(@template Region ListOfRegion add-param encapsulated)
(define (all-with-color c r)
  (local [(define (fn-for-region r)
            (cond [(terminal? r)
                   (if (string=? (terminal-color r) c) (list r) empty)]
                  [(group? r)
                   (if (string=? (group-color r) c)
                       (cons r (fn-for-lor (group-subs r)))
                       (fn-for-lor (group-subs r)))]))

          (define (fn-for-lor lor)
            (cond [(empty? lor) empty]
                  [else
                   (append (fn-for-region (first lor))
                           (fn-for-lor (rest lor)))]))]
    
    (fn-for-region r)))

