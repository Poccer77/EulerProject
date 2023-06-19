;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |9. PythegoreanTriplet|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

(define (find-triplet sum)
  (local [(define start (floor(/ sum 3)))
          (define (find-triplet a b c)
            (cond
              [(> (+ a b) (* sum (/ 2 3))) (find-triplet (- a 1) a (+ a 1))]
              [((= (pow (+ a b) 2) (pow c)) & (= (+ a b c) sum)) (* a b c)]
              [else (find-triplet a (+ b 1) 
      