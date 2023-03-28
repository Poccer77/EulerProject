;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname LargestPalyndromicFactor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; largest palyndrome of two numbers

(define (largest-palyndrome digits)
  (local
    
   [(define largest-multiplicant (string->number (make-string digits #\9)))
    (define (palyndrome? str)
       (string=? (substring str 0 (floor (/ (string-length str) 2))) (list->string (reverse (string->list (substring str (ceiling (/ (string-length str) 2)) (string-length str)))))))
    (define (check-through-multiples current-lowest x)
       (cond
         [(palyndrome? (number->string (* current-lowest x))) (list (* current-lowest x) current-lowest x)]
         [(equal? x largest-multiplicant) (check-through-multiples (- current-lowest 1) (- current-lowest 1))]
         [else (check-through-multiples current-lowest (+ x 1))]))]

    (check-through-multiples largest-multiplicant largest-multiplicant)))

(largest-palyndrome 3) 