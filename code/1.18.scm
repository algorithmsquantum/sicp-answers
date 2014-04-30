(load "common.scm")

; 不变量 a, 状态量 c, 计数器 b

; c + ab = c + 2a(b/2)

; c + ab = (c+a) + a(b-1)

(define (fast-multiplied a b)
  (define (mutiplied-iter c a b)
    (cond ((= b 0) c)
          ((even? b) (mutiplied-iter c (double a) (halve b)))
          (else (mutiplied-iter (+ c a) a (- b 1)))
          )
    )
  (mutiplied-iter 0 a b)
  )

(display (fast-multiplied 1 3))
(newline)
(display (fast-multiplied 2 10000000))
