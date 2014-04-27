(load "1.6.scm")

;(display (sqrt? 9)); 3.00009155413138
;(display (sqrt? 900000000000)); 948683.2980505137
;(display (sqrt? 9000000000000)); 3000000.
;(display (sqrt? 0.4)); .6324638844301766
;(display (sqrt? 0.000000004)); .03125004262498841
;(display (sqrt? 0.00000000000000004)); .03125000000000043
;(display (sqrt? 0.000000000000000004)); .03125000000000004
;(display (sqrt? 0.0000000000000000004)); .03125

; 可见对于大数和小数的求值, 精度越来越小(对于大数来说 good-enough? 可能永远到不了, 然后就会无限求值下去,
; 而对于小数来说, good-enough? 很快就满足了);

; 下面的做法采用了典型的 (X0 - X1)/X0 逼近.

(define (improve-guess guess x)
 (average guess (/ x guess)))

(define (good-enough? guess x)
 (< (/ (abs (- guess (improve-guess guess x))) guess) 0.001))

(define (average a b)
 (/ (+ a b) 2))

(define (sqrt-iter guess x)
 (if (good-enough? guess x)
  guess
  (sqrt-iter (improve-guess guess x) x)))

(define (sqrt? x)
 (sqrt-iter 1.0 x))

;(display (sqrt? 900000000000000000000000000000000000000000))
;(display (sqrt? 0.000000000000000000000000000000000000000004))

; 下面的方法是在之前基础上的改进(大数的计算没有上面的精度高, 小数的计算优于上面).

(define (good-enough? guess x)
 (< (/ (abs (- (square guess) x)) guess) (* guess 0.0001)))
