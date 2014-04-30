(define (halve a) (/ a 2))
(define (double a) (+ a a))

; 状态量 b, b = 0, result = 0
; 状态变化
; b 是偶数时, ab = (2a)(b/2), a -> 2a, b -> b/2
; b 是奇数时, ab = a(b-1) + a, a -> a, b -> (b-1)
(define (multiplied a b)
  (define (multiplied-iter a b)
    (cond ((= b 0) 0)
          ((even? b) (multiplied (double a) (halve b)))
          (else (+ a (multiplied a (- b 1))))
          )
    )
  (multiplied-iter a b)
  )
;           |
;           |
;           |
;          \|/

(define (multiplied a b)
  (cond ((= b 0) 0)
        ((even? b) (multiplied (double a) (halve b)))
        (else (+ a (multiplied a (- b 1))))
        )
  )

(display (multiplied 1 3))
(newline)
(display (multiplied 2 9))

