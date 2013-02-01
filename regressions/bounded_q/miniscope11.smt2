

(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun q1 (Int Real) Bool)
(declare-fun q2 (Real Real) Bool)
(declare-fun q3 (Int Int Real) Bool)

(assert (forall ((x1 Int) (x2 Real))
                (or (q2 x2 x2) (forall ((y Int)) (or (q1 y x2) (q3 y x1 x2))))))

(apply miniscope)
