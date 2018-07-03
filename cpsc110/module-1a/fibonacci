;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fibonacci) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (do_fib n max_n term next_term)
  (if (>= n max_n)
      term
      (do_fib (+ n 1)
              max_n
              next_term
              (+ term next_term))))

(define (fib n)
  (cond
    [(>= n 3) (do_fib 3 n 2 3)]
    [(or (= n 1) (= n 2)) 1]
    [else -1]))

(fib 5)
