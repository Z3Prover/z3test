
(declare-fun f (Int Int) Int)


(assert (forall ((x Int) (y Int))
                (or
                 (not (>= x 0)) 
                 (not (<= x 500000))
                 (not (>= y 0))
                 (not (<= y 2))
                 (not (= (f x y) (f 2 y)))
                 )))

(apply (! expand_bounded_quantifiers :filter_instances true))
