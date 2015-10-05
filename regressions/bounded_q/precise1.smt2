
; Copyright (c) 2015 Microsoft Corporation


(declare-fun p (Int Int) Bool)
(declare-const a Int)

(assert (forall ((x Int)) (=> (and (<= 0 x) (<= x a))
                              (p x x))))

(apply expand_bounded_quantifiers)
(apply (! expand_bounded_quantifiers :precise true))