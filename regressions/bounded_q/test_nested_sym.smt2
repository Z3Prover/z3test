
; Copyright (c) 2015 Microsoft Corporation
(declare-fun p (Int Int) Bool)


(assert (forall ((x Int))
                (=> (>= x 0) (<= x 5)
                    (forall ((y Int)) 
                            (=> (>= y 0) (<= y x)
                                (p x y))))))


(apply expand_bounded_quantifiers)



