
; Copyright (c) 2015 Microsoft Corporation


(declare-fun p (Int Int) Bool)

(assert (forall ((x Int)) (=> (and (<= 0 x) (<= x 5))
                              (forall ((y Int))
                                      (=> (and (<= 0 y) (<= y x))
                                          (p x y))))))

(apply (! expand_bounded_quantifiers :max-instances 3))
(apply (! expand_bounded_quantifiers :max-instances 6))
