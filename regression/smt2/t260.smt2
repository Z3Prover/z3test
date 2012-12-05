


(set-option :produce-models true)
(declare-const a Int)
(declare-const b Int)

(assert (<= 0 a))
(assert (<= a 5))
(assert (<= 0 b))
(assert (<= b 5))
(assert (not (= (- a b) 3)))
(assert (not (= a b)))
(assert (not (= a (+ b 1))))
(assert (not (= a (- b 1))))

(check-sat-using (and-then (! simplify :arith-lhs true) diff-neq))
(get-model)

(assert (>= a b))

(check-sat-using (and-then (! simplify :arith-lhs true) diff-neq))

