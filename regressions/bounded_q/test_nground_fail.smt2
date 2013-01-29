
(declare-fun q (Int) Bool)
(declare-fun f (Int) Int)


(assert (forall ((z Int)) (=> (and (< (f z) z) (>= 3 z)) (not (q z)))))


(apply (then simplify nnf normalize_bounded_quantifiers))

