
(declare-fun r (Int Int) Bool)
(declare-fun x () Int)



(assert (forall ((z Int) (u Int)) (=> (and (> z 0) (< z 3) (>= u 0) (< (* 3 u) 11)) (r u z))) )


(apply (then (! simplify :arith-lhs true) nnf expand_bounded_quantifiers))

