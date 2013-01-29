

(declare-fun p (Int) Bool)

(assert (forall ((i Int)) (implies (and (<= 10 i) (<= i 30)) (p i))))

(apply (then (! simplify :arith-lhs true) nnf expand_bounded_quantifiers))
