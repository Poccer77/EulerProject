;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; n-th prime number

(define (nth-prime n)
  (local
    [(define (prime-check x lst)
        (empty? (filter (lambda (y) (= (modulo x y) 0)) lst)))
      (define (iterate x lst limit)
        (cond
          [(= (length lst) limit) (first (reverse lst))]
          [(prime-check x lst) (iterate (+ x 1) (append lst (list x)) limit)]
          [else (iterate (+ x 1) lst limit)]))]
    (iterate 2 (list 2) n)))

(nth-prime 10001)