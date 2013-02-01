(declare-fun p (Int) Bool)
(declare-fun a () Int)

(assert (<= a 1))
(assert (forall ((x Int)) (=> (and (not (< x 0)) (<= x a) (not (> x 60000))) (p x))))

(apply (! expand_bounded_quantifiers :use_constant_bounds false))

