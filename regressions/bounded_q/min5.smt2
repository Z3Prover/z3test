
; Copyright (c) 2015 Microsoft Corporation


(declare-const a Int)
(declare-const b Int)
(declare-fun p (Int) Bool)
(declare-fun f (Int) Int)
(set-option :pp.max-depth 100)

(assert (<= b 10))
(assert (forall ((x Int)) (=> (and (<= 0 x) (<= x (f x)) (<= (f x) a)) (p x))))
(assert (forall ((x Int)) (=> (and (<= 0 x) (<= x (f x))) (p x))))
(assert (<= a (- b 5)))
(apply minimize_bounded_quantifiers)