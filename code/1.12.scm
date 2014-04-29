(define (pascal row col)
 (cond
  ; 边界之外 0
  ((or
    (< row 1)
    (< col 1)
    (< row col)) 0)
  ; 边界 1
  ((or
    (= col 1)
    (= row col)) 1)
  ; 三角形内
  (else (+ (pascal (- row 1) (- col 1))
         (pascal (- row 1) col)))
 ))

(display (pascal 4 3))
