(define (a-plus-abs-b a b)
 ;; 如果 b > 0, 那么 (if (> b 0) + -) 将返回 +; 反之返回 -.
 ;; 这是函数作为值传递的特性, 是高阶函数的基础.
 ;; 如果读者了解 Haskell (柯里化), 那么对这里就会更加了解.
 ((if (> b 0) + -) a b))

(display (a-plus-abs-b 5 -4))
