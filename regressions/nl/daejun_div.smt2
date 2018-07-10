(declare-fun x () Int)
(declare-fun y () Int)

(assert (> x 0))
(assert (> y 0))

; (x * y) / y == x 
 (assert (not (= (div (* x y) y) x))) ; timeout
;(assert (not (= (/   (* x y) y) x))) ; unsat

(check-sat)
