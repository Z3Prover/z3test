

(declare-const a Int)
(declare-const b Int)

(assert (or (= a 1) (= a 2)))
(assert (> b (+ a 1)))
(assert (< b 4))

(apply (par-then split-clause (then solve-eqs propagate-ineqs solve-eqs)))

(check-sat-using (par-then split-clause (then solve-eqs propagate-ineqs solve-eqs)))
(get-model)