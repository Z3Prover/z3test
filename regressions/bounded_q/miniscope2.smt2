
(set-option :pp.max-depth 100)

(declare-fun p (Int Real) Bool)
(declare-fun q (Int) Bool)
(declare-fun r (Int Bool) Bool)

(assert (forall ((x2 Int) (x1 Int) (y Real) (z Bool)) (or (p x1 y) (p (+ x2 1) y) (r 0 z))))

(apply miniscope)
