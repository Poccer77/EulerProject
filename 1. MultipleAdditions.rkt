;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname MultipleAdditions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;multiples of x and y

(define (multiple-addition x y)
  (local [(define (recursion x y accu lst)
            (cond
              [(>= accu 1000) lst]
              [(or (= (modulo accu x) 0) (= (modulo accu y) 0)) (recursion x y (+ accu 1) (cons accu lst))]
              [else (recursion x y (+ accu 1) lst)]))]
    (foldr + 0 (recursion x y 1 '()))))

(multiple-addition 3 5)

              