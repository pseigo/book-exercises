;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname lec19-additional-problems-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)


;;=============
;; Constants:
(define I1 (circle 10 "solid" "green"))
(define I2 (rectangle 30 23 "outline" "black"))
(define I3 (square 21 "outline" "pink"))
(define I4 (square 99 "solid" "orange"))
(define I5 (circle 5 "solid" "blue"))

;;=================
;; Data Definitions:
(@HtDD ListOfNumber)
;; ListOfNumber is one of:
;; - empty
;; - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON0 empty)
(define LON1 (cons 10 (cons -3.2 empty)))

(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))


(@HtDD ListOfImage)
;; ListOfImage is one of:
;; - empty
;; - (cons Image ListOfImage)
;; interp. a list of images
(define LOI0 empty)
(define LOI1 (cons I1 (cons I2 empty)))


(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))



;;PROBLEM:
;;
;;Design a function that consumes two lists of numbers. Each list
;;is already sorted in increasing order. The function should produce
;;the merged list sorted in increasing order.
;;Show the cross product of type comments table, the simplification,
;;and the correspondence between table cells and cond cases.
;;
;;For example:
;;
;;  (merge (list 2 3 5) (list 1 4 6)) --> (list 1 2 3 4 5 6) 
;;
(@Problem 1)


;;PROBLEM:
;;
;;Design the function overlay-images that consumes two lists of images.
;;The function should produce a list that contains each image in lsta
;;overlaid on the corresponding image (by position) in lstb.
;;
;;Assume that both lists are the same length.


(@Problem 2)



