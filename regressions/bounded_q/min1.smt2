
; Copyright (c) 2015 Microsoft Corporation


(declare-const a Int)
(declare-fun p (Int) Bool)
(set-option :pp.max-depth 100)

(assert (<= a 10))
(assert (forall ((x Int)) (=> (and (<= 0 x) (<= x a)) (p x))))
(apply minimize_bounded_quantifiers)