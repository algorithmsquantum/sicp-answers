; 下面的做法采用了典型的 (X0 - X1)/X0 逼近.

(define (improve-guess guess x)
 (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
(< (/ (abs (- guess (improve-guess guess x))) guess) 0.001))
;(< (abs (- (* guess guess guess) x)) 0.001))

(define (cube-root-iter guess x)
 (if (good-enough? guess x)
  guess
  (cube-root-iter (improve-guess guess x) x)))

(define (cube-root x)
 (cube-root-iter 1.0 x))

(display (cube-root 100000000000000000000000000000000)); 4.641721617671784e10
