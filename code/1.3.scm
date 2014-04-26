;; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
(define (<= a b)
 (not (> a b)))

(define (bigger-2-sum-of-square a b c)
 (cond
  ((and (<= a b) (<= a c)) (+ (* b b) (* c c)))
  ((and (<= b a) (<= b c)) (+ (* a a) (* c c)))
  (else (+ (* a a) (* b b)))))

(display (bigger-2-sum-of-square 1 2 5))
;;(display (bigger-2-sum-of-square 1 1 5))
;;(display (bigger-2-sum-of-square 1 1 1))
