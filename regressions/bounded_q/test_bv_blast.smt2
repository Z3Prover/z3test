
; Copyright (c) 2015 Microsoft Corporation
(define-sort W () (_ BitVec 5))
(declare-fun p (W) Bool)

(assert (forall ((x W)) (p x)))

(apply expand_bounded_quantifiers)