; 递归方式实现

(define (f n)
 (if (< n 3)
  n
  (+ (f (- n 1)) (* 2 (f (- n 2)))
   (* 3 (f (- n 3))))))

; 迭代实现

; 自下而上
; 初始条件: f(0) = 0, f(1) = 1, f(2) = 2
; a = f(n-4), b = f(n-3), c = f(n-2)
; f(n-1) = 3f(n-4) + 2f(n-3) + f(n-2) = 3a + 2b + c
; f(n)   = 3f(n-3) + 2f(n-2) + f(n-1) = 3b + 2a + (3a + 2b + c)
; 仔细观察参数的变化: a -> b, b -> c, c -> (3a + 2b + c), counter = counter -1
; 中止条件: counter = 0, f(n) = a
; 我们求得 f(n) 的值的同时, 也求得了 f(n+1), f(n+2) 的值, 多计算了 2 次.

(define (f n)
 (define (f-iter a b c counter)
  (if (= counter 0)
   a
   (f-iter b c (+ (* 3 a) (* 2 b) c) (- counter 1))))
 (f-iter 0 1 2 n))

; (display (f 4))


; 自上而下
; 初始条件: f(0) = 0, f(1) = 1, f(2) = 2
; a = f(n-2), b = f(n-3), c = f(n-4)
; f(n-1) = 3f(n-4) + 2f(n-3) + f(n-2) = 3c + 2b + a
; f(n)   = 3f(n-3) + 2f(n-2) + f(n-1) = 3b + 2a + (3c + 2b + a)
; 仔细观察参数的变化: a -> (3c + 2b + a), b -> a, c -> b, counter = counter -1
; 中止条件: counter < 3, f(n) = a
; 不会产生多余运算.

(define (f n)
 (define (f-iter a b c counter)
  (if (< counter 3)
   a
   (f-iter (+ (* 3 c) (* 2 b) a) a b (- counter 1))))
 (if (< n 3)
  n
  (f-iter 2 1 0 n)))

(display (f 4))
