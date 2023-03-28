;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname LargestPrimeFactor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;largest prime factors

(define (largest-prime-factor x)
  (local
    [(define (prime? x factor)
       (cond
         [(and (= (modulo x factor) 0) (not (or (= factor 1) (= factor x)))) #f]
         [(> factor (/ x 2)) #t]
         [else (prime? x (+ factor 1))]))
         
        
    (define (factorization x factor accu)
       (cond
         [(<= factor 1) factor]
         [(and (= (modulo x factor) 0) (prime? factor 1)) factor]
         [else (factorization x (if (integer? (/ x accu)) (/ x accu) (round (/ x accu))) (+ accu 1))]))]
    
    (factorization x (if (integer? (/ x 2)) (/ x 2) (round (/ x 2))) 2)))

(largest-prime-factor 600851475143)
           
              