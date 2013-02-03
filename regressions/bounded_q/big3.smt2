
(declare-fun p (Int Int) Bool)

(assert (forall ((x Int) (y Int))
                (=> (and (<= 0 x)
                         (<= x 100000000000000000000000000000000000000000000003)
                         (<= 0 y)
                         (<= y (- x))
                         )
                    (p x y))))

(apply (then minimize_bounded_quantifiers expand_bounded_quantifiers))
