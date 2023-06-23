;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |9. PythegoreanTriplet|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

(define (find-triplet sum)
  (local [(define start (floor(/ sum 3)))
          (define (inner-find-triplet a b)
            (local [(define c (sqrt (+ (expt a 2) (expt b 2))))]
            (cond
              [(> (+ a b) (* sum (/ 2 3))) (inner-find-triplet (- a 1) a)]
              [(= (+ a b c) sum) (* a b c)]
              [else (inner-find-triplet a (+ b 1))])))]
    (inner-find-triplet start (+ start 1)))) 

(find-triplet 1000)


      