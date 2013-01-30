

(declare-fun p (Int) Bool)

(assert (forall ((i Int)) (implies (and (<= 10 i) (<= i 30)) (p i))))

(apply expand_bounded_quantifiers)
