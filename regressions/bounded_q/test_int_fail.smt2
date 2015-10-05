
; Copyright (c) 2015 Microsoft Corporation
(declare-fun p (Int) Bool)

(assert (forall ((x Int)) (=> (> x 0) (p 0))))

(apply expand_bounded_quantifiers)