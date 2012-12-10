
(set-option :auto-config true)
(declare-const a Int)
(declare-const b Int)

(assert 
 (>= (- a (ite (<= a 0) (* 3 b) b)) 2)
)

(check-sat)

(eval (>= (- a (ite (<= a 0) (* 3 b) b)) 2))
