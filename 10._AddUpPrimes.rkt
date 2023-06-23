#lang racket
;; add up all prime numbers up to n

(define (add-up-primes n)
  (local
     [(define (prime-check x lst)
        (false? (findf (lambda (y) (= (modulo x y) 0)) lst)))
      (define (iterate x lst limit)
        (cond
          [(>= x limit) (foldl + 0 lst)]
          [(prime-check x lst) (iterate (+ x 2) (append lst (list x)) limit)]
          [else (iterate (+ x 2) lst limit)]))]
    (iterate 3 (list 2) n))) 

(add-up-primes 2000000) 