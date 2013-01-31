

(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun q (Int Int) Bool)
(declare-fun r (Int Int) Bool)

(assert (forall ((x Int) (y Int) (z Int)) (or (p x) (q x y) (r x z))))

(apply miniscope)
