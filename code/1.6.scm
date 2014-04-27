(define (good-enough? guess x)
 (< (abs (- (* guess guess) x)) 0.001))

(define (average a b)
 (/ (+ a b) 2))

(define (improve-guess guess x)
 (average guess (/ x guess)))

(define (sqrt-iter guess x)
 (if (good-enough? guess x)
  guess
  (sqrt-iter (improve-guess guess x) x)))

;(define (sqrt-iter guess x)
; (cond ((good-enough? guess x) guess)
;  (else (sqrt-iter (improve-guess guess x) x))))

(define (sqrt? x)
 (sqrt-iter 1.0 x))

;(display (sqrt? 9)) ; 3.00009155413138

; -----------------------------------------------

(define (new-if predicate then-clause else-clause)
 (cond (predicate then-clause)
  (else else-clause)))

; 根据应用序求值(先求值参数而后应用), 第三个参数 else-clause 也要求值,
; 那么 对 sqrt-iter 的求值会引发递归调用 sqrt-iter 自身, 而无中止条件的判断,
; 这样递归调用就无法中止, 程序僵住.
