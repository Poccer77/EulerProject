#lang racket

(define (product-in-matrix lst x-dim prod-length)
  (local [(define (skip-list lst dir)
            (cond
              [(= 0 dir) lst]
              [(empty? (rest lst)) (list)]
              [else (skip-list (rest lst) (- dir 1))]))
          (define (test-prod lst prod dir prod-length)
            (cond
              [(empty? lst) 0]
              [(= 0 prod-length) prod]
              [else (test-prod (skip-list lst dir) (* prod (first lst)) dir (- prod-length 1))]))
          (define (go-through lst biggest-prod)
            (cond
              [(empty? (rest lst)) biggest-prod]
              [(< biggest-prod (test-prod lst 1 (+ x-dim (+ (- x-dim) 1)) prod-length)) (go-through lst (test-prod lst 1 -19 prod-length))]
              [(< biggest-prod (test-prod lst 1 (+ x-dim 1) prod-length)) (go-through lst (test-prod lst 1 -19 prod-length))]
              [(< biggest-prod (test-prod lst 1 x-dim prod-length)) (go-through lst (test-prod lst 1 -19 prod-length))]
              [(< biggest-prod (test-prod lst 1 (- x-dim 1) prod-length)) (go-through lst (test-prod lst 1 -19 prod-length))]
              [else (go-through (rest lst) biggest-prod)]))]
    (go-through lst 0)))

(product-in-matrix (list 1 2 3 4 5 6 7 8) 4 2)
          