

(declare-const a Int)
(declare-fun p (Int Int) Bool)

(assert (forall ((x Int) (y Int)) 
                (=> 
                 (and
                  (>= x 0) (<= x a)
                  (>= y 0) (<= y 10))
                 (p x y))))

(apply (! expand_bounded_quantifiers :domain 2 :max-instances 15))
(apply (! expand_bounded_quantifiers :domain 2 :max-instances 100))