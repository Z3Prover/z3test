
; Copyright (c) 2015 Microsoft Corporation

(declare-fun a () Int)
(declare-fun p (Int) Bool)
(set-option :pp.max-depth 100)
(assert (forall ((x Int))
                (=> (and (> x 0) (<= x (ite (> a 15) 5 a)))
                    (p x))))

(apply expand_bounded_quantifiers)