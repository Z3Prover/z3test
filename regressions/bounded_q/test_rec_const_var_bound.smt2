
; Copyright (c) 2015 Microsoft Corporation

(declare-fun a () Int)
(declare-fun p (Int Int) Bool)

(set-option :pp.max-depth 100)

(assert (forall ((y Int) (x Int))
			(=> (and (> y 0) (< y 4) (> x 0) (<= x (ite (<= a y) a y)))
                            (p x y))))

(apply (then expand_bounded_quantifiers (! simplify :pull-cheap-ite true)))