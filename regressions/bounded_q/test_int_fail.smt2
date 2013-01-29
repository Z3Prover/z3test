(declare-fun p (Int) Bool)


(assert (forall ((x Int)) (=> (> x 0) (p 0))))

(apply (then (! simplify :arith-lhs true) nnf expand_bounded_quantifiers))