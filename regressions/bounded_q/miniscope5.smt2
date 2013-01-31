

(set-option :pp.max-depth 100)
(declare-fun p (Int Real) Bool)
(declare-fun q (Int) Bool)
(declare-fun r (Int Bool) Bool)

(assert (or (q 0) (forall ((x2 Int) (x1 Int) (y Real) (z Bool)) (and (not (or (p x1 y) (q x1))) (p (+ x2 1) y)))))

(apply miniscope)
