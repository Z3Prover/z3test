
; Copyright (c) 2015 Microsoft Corporation

(declare-sort U 0)
(declare-fun p (U Int) Bool)
(declare-fun f (U) Int)

(assert (forall ((x U) (z Int)) 
			(=> (and (>= z 0) (<= z (f x)))
			(p x z))))

(apply expand_bounded_quantifiers)