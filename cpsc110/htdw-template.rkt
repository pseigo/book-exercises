;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdw-template) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)
(require 2htdp/universe)

;; My world program (make this more specific)
(@HtDW WS)
;; ==================
;; Constants:

(define FREQ 10) ; 10 ticks per second
(define PERIOD (/ 1 FREQ)) ; 1/10 seconds per tick

(define WIDTH 250)
(define HEIGHT 100)
(define MTS (empty-scene WIDTH HEIGHT))

;; ==================
;; Data definitions:

(@HtDD WS)
;; WS is ... (give WS a better name)

;; ==================
;; Functions:

(@HtDF main)
(@signature WS -> WS)
;; start the world with (main ...)
;;
(@template htdw-main)
(define (main ws)
  (big-bang ws               ; WS
    (on-tick   tock PERIOD)  ; WS -> WS
    (to-draw   render)       ; WS -> Image
    (stop-when stop?)        ; WS -> Boolean
    (on-mouse  handle-mouse) ; WS Integer Integer MouseEvent -> WS
    (on-key    handle-key))) ; WS KeyEvent -> WS

(@HtDF tock)
(@signature WS -> WS)
;; produce the next ...
;; !!!
(define (tock ws) ...)

(@HtDF render)
(@signature WS -> Image)
;; render ...
;; !!!
(define (render ws) ...)

#;#;
(@template WS)
(define (render ws)
  (place-image ... ; image
               ... ; x-pos
               ... ; y-pos
               MTS))


(@HtDF stop?)
(@signature WS -> Boolean)
;; produce true ... ; otherwise false
;; !!!
(define (stop? ws) ...)

(@HtDF handle-mouse)
(@signature WS Integer Integer MouseEvent -> WS)
;; do ... when ... is pressed
;; !!!
(define (handle-mouse ws x y me) ...)

(@HtDF handle-key)
(@signature WS KeyEvent -> WS)
;; do ... when ... key is pressed
;; !!!
(define (handle-key ws ke) ...)

(@template)