;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname EvenFibonacci) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;even fibonacci numbers sum

(define (even-fibonacci x y limit lst)
  (cond
    [(> (+ x y) limit) (foldr + 0 lst)]
    [else (even-fibonacci y (+ x y) limit (if (= (modulo (+ x y) 2) 0) (cons (+ x y) lst) lst))]))

(even-fibonacci 1 2 4000000 '(2))