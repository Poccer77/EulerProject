;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |4. LargestPalyndromicFactor|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; largest palyndrome of two numbers

(define (largest-palyndrome digits)
  (local
   [(define largest-multiplicant (string->number (make-string digits #\9)))
    (define (palyndrome? str)
       (string=? (substring str 0 (floor (/ (string-length str) 2))) (list->string (reverse (string->list (substring str (ceiling (/ (string-length str) 2))))))))
    (define (check-through-multiples current-lowest x accu)
       (cond
         [(< x current-lowest) (check-through-multiples (- current-lowest 1) largest-multiplicant accu)]
         [(palyndrome? (number->string (* current-lowest x))) (cons (list current-lowest x (* current-lowest x)) accu)]
         [else (check-through-multiples current-lowest (- x 1) (cons (list current-lowest x (* current-lowest x)) accu))]))]

    (check-through-multiples largest-multiplicant largest-multiplicant empty)))

(largest-palyndrome 3)


