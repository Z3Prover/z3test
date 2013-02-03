

(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun q (Int) Bool)

(assert (forall ((x Int) (y Int)) (implies (and (<= 0 x) (<= x 3) (<= 0 y) (<= y 4)) (or (p x) (q y)))))

(apply (then (! simplify :elim-and true) miniscope))

(apply (then (! simplify :elim-and true) miniscope expand_bounded_quantifiers))
