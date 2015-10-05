
; Copyright (c) 2015 Microsoft Corporation
(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun a () Int)
(declare-fun b () Int)
(set-option :pp.max-depth 100)
(assert (forall ((x Int)) (=> (and (not (< x 0)) (<= x a) (<= x 10000) (<= x 60) (<= x b)) (p x))))

(apply (then (! expand_bounded_quantifiers :max-instances 100) (! simplify :pull-cheap-ite true)))

