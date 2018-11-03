;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 25-oob-1-quick-sort-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
;; This example will look at a way to sort a list of numbers.
;;
;; The strategy of this algorithm is to first make the problem smaller by
;; breaking it into two lists, sort them, and then put them back together. 
;; 
;; We break the list into two lists by taking the first element, which we call
;; the PIVOT, and then filtering out two lists, one with element values less
;; than the pivot and one with element values greater than the pivot. Once
;; those lists are sorted, we can append the "smaller value" list, with a list
;; containing just the pivot, with a third list the "bigger value" list.
;; Appending these three lists together gets us the result.
;;
;;                   (list 6 8 1 9 3 7 2) 
;;                   /         |        \
;;                  /          |         \
;;        (list 1 3 2)         6        (list 8 9 7)
;;         /  |  \                         /    |    \
;;        /   |   \                       /     |     \
;;     empty  1 (list 3 2)          (list 7)    8    (list 9)
;;                /  |  \             / | \           /  |  \
;;               /   |   \           /  |  \         /   |   \
;;          (list 2) 3  empty     empty 7 empty    empty 9  empty
;;           /     \
;;        empty   empty
;;
;; This way of sorting is called QUICKSORT. 
;;
;; Problem: Finish the design of the qsort function, which sorts a list using
;; the method described above.
;;

(@signature (listof Natural)  ->  (listof Natural))
;; produce list of numbers sorted in ASCENDING order
;; ASSUMPTION: lon contains no duplicates
(check-expect (qsort empty)                empty)
(check-expect (qsort (list 8))             (list 8))
(check-expect (qsort (list 7 8 9))         (list 7 8 9))
(check-expect (qsort (list 4 3 2 1))       (list 1 2 3 4))
(check-expect (qsort (list 6 8 1 9 3 7 2)) (list 1 2 3 6 7 8 9))

;(define (qsort lon) empty) ;stub

(@template genrec)
(define (qsort lon)
  (cond [(empty? lon) empty]
        [else
         (local [(define pivot (first lon))
                 (define (less-than-p? n) (< n pivot))
                 (define (greater-than-p? n) (> n pivot))]
                 (append
                  (filter less-than-p? (rest lon))
                  (list pivot)
                  (filter greater-than-p?)))]))

;; NOT FINISHED!