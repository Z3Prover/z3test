
(declare-fun r (Int Int) Bool)
(declare-fun a () Int)

(assert (forall ((x Int))
                (=> (and (<= 0 x) (<= x 3))
                    (forall ((y Int))
                            (=> (and (<= 0 y) (<= y x))
                                (r x y))))))

(apply expand_bounded_quantifiers)

