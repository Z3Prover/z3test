
; Copyright (c) 2015 Microsoft Corporation

(declare-fun a () Int)
(declare-fun p (Int Int) Bool)

(assert (forall ((y Int) (x Int))
			(=> (and (> y 0) (< y 10) (> x 0) (<= x (ite (<= 5 y) 5 y)))
                            (p x y))))

(apply expand_bounded_quantifiers)