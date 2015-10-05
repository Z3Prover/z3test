
; Copyright (c) 2015 Microsoft Corporation

(declare-fun p (Int Int) Bool)

(assert (forall ((x Int) (y Int))
                (=> (and (<= 100000000000000000000000000000000000000000000000 x)
                         (<= x 100000000000000000000000000000000000000000000003)
                         (<= 100000000000000000000000000000000000000000000000 y)
                         (<= y x))
                    (p x y))))

(apply (then minimize_bounded_quantifiers expand_bounded_quantifiers))
