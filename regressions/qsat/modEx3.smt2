
(set-info :status sat)
(declare-const a Int)
(assert (forall ((x Int)) (exists ((y Int)) (or (<= (mod (+ (* 4 y) a) 3) x) (> (mod (+ y 1 a) 2) x)))))
(check-sat)
(get-model)
