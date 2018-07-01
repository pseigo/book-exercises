;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)

; function definitions allow us to create primitives

; function definition
(define (fun_name param_one)  ; defines fun_name as a function
  param_one)                  ;   of one argument

; function call
(fun_name 3)

; step-by-step evaluation
(define (hyp x y)
  (sqrt (+ (sqr x) (sqr y))))

(hyp 3 (+ 1 3))               ; initial expression
(hyp 3 4)                     ; evaluate (+ 1 3)
(sqrt (+ (sqr 3) (sqr 4)))    ; replace function call with function definition
(sqrt (+ 9 (sqr 4)))          ; evaluate (sqr 3)
(sqrt (+ 9 16))               ; evaluate (sqr 4)
(sqrt 25)                     ; evaluate (sqrt 25)
5                             ; done, value cannot be reduced

; ======= EXAMPLES ========
; example 1
(define (bulb color)
  (circle 40 "solid" color))

(above (bulb "red")
       (bulb "yellow")
       (bulb "green"))


; example 2: the function body has THREE expressions, not one.
;              this happens because multiple expressions are
;              allowed in a function body (but not in BSL).
(define (nobake flavor)
  string-append flavor "jello")
 
(nobake "green")
; > "jello"