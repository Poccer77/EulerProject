;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |5. SmallestDivisible|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Divisible by everyone and your mother

(define (divisible-up-to-x x)
  (local
    [(define (mult-up z accu)
       (cond
         [(= z 1) accu]
         [else (mult-up (- z 1) (* accu z))]))
     (define (check-divide base it)
       (cond
         [(> it x) #t]
         [(not (= (modulo base it) 0)) #f]
         [else (check-divide base (+ it 1))]))
     (define (walkthrough it lowest)
        (cond
          [(<= it 1) lowest]
          [(check-divide (/ lowest it) 1) (walkthrough x (/ lowest it))]
          [else (walkthrough (- it 1) lowest)]))]
    
    (walkthrough 2 (mult-up x 1))))

(divisible-up-to-x 7) 

          
          