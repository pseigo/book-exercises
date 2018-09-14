;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname images) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

; use the image functions from the 2nd edition of the How To Design Programs book
(require 2htdp/image)

; circle radius "solid/outline/(0-255)" "colour"
(circle 10 "solid" "red")

; rectangle width height "solid/outline/(0-255)" "colour"
(rectangle 30 60 "outline" "blue")

; text "string" font-size "font-color"
(text "hello" 24 "orange")

; overlay/above/beside
(overlay (circle 10 "solid" "red")
         (circle 20 "solid" "yellow")
         (circle 30 "solid" "green"))

; connects (0, 0) to (x1, y1)
(line 10 50 "red")

(scale 1 (underlay (rectangle 300 600 "solid" (make-color 240 240 245))
                   (radial-star 150 70 120 150 "lightblue")
                   (regular-polygon 50 9 70 "blue")
                   (regular-polygon 48 8 90 "lightblue")
                   (regular-polygon 46 7 100 "lightblue")
                   (regular-polygon 44 6 150 "lightblue")
                   (regular-polygon 42 5 200 "lightblue")
                   (radial-star 50 0 100 "outline" "white")
                   (radial-star 50 0 40 "solid" "black")))
