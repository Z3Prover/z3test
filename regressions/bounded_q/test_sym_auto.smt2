
; Copyright (c) 2015 Microsoft Corporation
(declare-fun q (Int) Bool)
(declare-fun x () Int)

(assert (forall ((z Int)) (=> (and (< z (+ x 30)) (> z x)) (q z))))

(apply expand_bounded_quantifiers)

