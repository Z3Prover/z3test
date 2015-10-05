
; Copyright (c) 2015 Microsoft Corporation

(declare-fun a () Int)
(declare-fun p (Int) Bool)

(set-option :pp.max-depth 100)

(assert (forall ((x Int))
                (=> (and (> x 0) (<= x (* 2 (ite (> a 11) 11 a))))
                    (p x))))

(apply (then expand_bounded_quantifiers (! simplify :pull-cheap-ite true)))