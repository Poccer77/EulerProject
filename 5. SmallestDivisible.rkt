;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname smallestDivisible) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Divisible by everyone and your mother

(define (divisible-up-to-x x)
  (local
    [(define (walkthrough it accu)
        (cond
          [(= it 1) accu]
          [(not (= (modulo accu it) 0)) (walkthrough (- it 1) (* accu it))]
          [else (walkthrough (- it 1) accu)]))] 
     (walkthrough x x)))
          