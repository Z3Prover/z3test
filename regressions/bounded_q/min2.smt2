

(declare-const a Int)
(declare-fun p (Int) Bool)
(set-option :pp.max-depth 100)

(assert (forall ((x Int)) (=> (and (<= 0 x) (<= x a)) (p x))))
(assert (<= a 10))
(apply minimize_bounded_quantifiers)