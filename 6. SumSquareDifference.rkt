;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |6. SumSquareDifference|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;difference between sum and square

(define (sum-square-difference x)
  (local
    [(define (sum-of-squares it accu)
       (cond
         [(> it x) accu]
         [else (sum-of-squares (+ it 1) (+ (expt it 2) accu))]))
     (define (square-of-sums it accu)
       (cond
         [(> it x) (expt accu 2)]
         [else (square-of-sums (+ it 1) (+ accu it))]))]
    (- (square-of-sums 1 0) (sum-of-squares 1 0))))

(sum-square-difference 100)

       
  