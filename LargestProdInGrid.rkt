#lang racket

(define (product-in-matrix lst x-dim prod-length)
  (local [(define (skip-list lst dir)
            (cond
              [(= 0 dir) lst]
              [(empty? (rest lst)) '()]
              [else (skip-list (rest lst) (- dir 1))]))
          (define (test-prod lst prod dir prod-length)
            (cond
              [(empty? lst) 0]
              [(= 0 prod-length) prod]
              [else (test-prod (skip-list lst dir) (* prod (first lst)) dir (- prod-length 1))]))
          (define (bounds-check index dir)
            (cond
              [(= dir 0) (or (< index (modulo (+ index (* 1 (- prod-length 1))) x-dim)) (< (+ index (* (- prod-length 1) x-dim)) (length lst)) (> index (modulo (- index (* 1 (- prod-length 1))) x-dim)))]
              [(= dir 1) (< index (modulo (+ index (* 1 (- prod-length 1))) x-dim))]
              [(= dir (+ x-dim 1)) (and (< index (modulo (+ index (* 1 (- prod-length 1))) x-dim)) (< (+ index (* (- prod-length 1) x-dim)) (length lst)))]
              [(= dir x-dim) (< (+ index (* (- prod-length 1) x-dim)) (length lst))]
              [(= dir (- x-dim 1)) (> index (modulo (- index (* 1 (- prod-length 1))) x-dim))]
              [else #f]))
          (define (go-through lst biggest-prod index)
            (cond
              [(empty? lst) biggest-prod]
              [(not (bounds-check index 0)) biggest-prod]
              [(and (bounds-check index 1) (< biggest-prod (test-prod lst 1 1 prod-length))) (go-through lst (test-prod lst 1 1 prod-length) index)]
              [(and (bounds-check index (+ x-dim 1)) (< biggest-prod (test-prod lst 1 (+ x-dim 1) prod-length))) (go-through lst (test-prod lst 1 (+ x-dim 1) prod-length) index)]
              [(and (bounds-check index x-dim) (< index (modulo (+ index (* 1 prod-length)) x-dim)) (< biggest-prod (test-prod lst 1 x-dim prod-length))) (go-through lst (test-prod lst 1 x-dim prod-length) index)]
              [(and (bounds-check index (- x-dim 1)) (< index (modulo (+ index (* 1 prod-length)) x-dim)) (< biggest-prod (test-prod lst 1 (- x-dim 1) prod-length))) (go-through lst (test-prod lst 1 (- x-dim 1) prod-length) index)]
              [else (go-through (rest lst) biggest-prod (+ index 1))]))] 
    (go-through lst 0 1)))

(product-in-matrix (list 1 2 3 4 5 6 7 8) 4 2)
          