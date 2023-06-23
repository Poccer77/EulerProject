;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |4. LargestPalyndromicFactor|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; largest palyndrome of two numbers

(define (largest-palyndrome digits)
  (local
   [(define largest-multiplicant (string->number (make-string digits #\9)))
    (define (palyndrome? str) (string=? (substring str 0 (floor (/ (string-length str) 2))) (list->string (reverse (string->list (substring str (ceiling (/ (string-length str) 2)) (string-length str)))))))
    (define (check-through-multiples distance-from-highest balance)
       (cond
         [(palyndrome? (number->string (* (- largest-multiplicant balance) (- largest-multiplicant (- distance-from-highest balance))))) (* (- largest-multiplicant balance) (- largest-multiplicant (- distance-from-highest balance)))]
         [(>= balance distance-from-highest) (check-through-multiples (+ distance-from-highest 1) 0)]
         [else (check-through-multiples distance-from-highest (+ balance 1))]))]

    (check-through-multiples 0 0)))

(largest-palyndrome 3)



