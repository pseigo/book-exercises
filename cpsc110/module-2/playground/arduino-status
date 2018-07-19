;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arduino-status) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Data definitions:

;; ArduinoStatus is one of:
;;   - "off"
;;   - "ready"
;;   - "busy"
;;   - "error"
;; interp. "off" as powered off, "ready" as ready to compute, "busy" as
;;   currently computing, "error" as an error has occurred
#;
(define (fn-for-arduinostatus status)
  (cond [(string=? status "off") (...)]
        [(string=? status "ready") (...)]
        [(string=? status "busy") (...)]
        [(string=? status "error") (...)]))



;; Functions:

;; ArduinoStatus -> Boolean
;; produce a guess whether the Arduino needs maintenance
(check-expect (needs-maintenance? "off") true)
(check-expect (needs-maintenance? "ready") false)
(check-expect (needs-maintenance? "busy") false)
(check-expect (needs-maintenance? "error") true)

;(define (needs-maintenance? status) true) ; stub

; Template from ArduinoStatus
#;
(define (needs-maintenance? status)
  (cond [(string=? status "off") (...)]
        [(string=? status "ready") (...)]
        [(string=? status "busy") (...)]
        [(string=? status "error") (...)]))

(define (needs-maintenance? status)
  (cond [(string=? status "off") true]
        [(string=? status "ready") false]
        [(string=? status "busy") false]
        [(string=? status "error") true]))
