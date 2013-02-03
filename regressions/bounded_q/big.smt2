
(declare-fun f (Int) Int)

(assert (forall ((x Int))
                (=> (and (<= 100000000000000000000000000000000000000000000000 x)
                         (<= x 100000000000000000000000000000000000000000000003))
                    (= (f x) (+ (f (- x 1)) 1)))))

(apply expand_bounded_quantifiers)
