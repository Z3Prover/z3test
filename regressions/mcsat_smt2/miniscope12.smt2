
; Copyright (c) 2015 Microsoft Corporation


(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun q1 (Int Real) Bool)
(declare-fun q2 (Real Real) Bool)

(assert (forall ((x1 Int) (x2 Real))
                 (=> (q2 x2 (ite (<= x2 0) (- x2) 0))
                     (q1 x1 x2))))

(apply miniscope)