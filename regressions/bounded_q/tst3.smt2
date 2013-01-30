
(declare-fun r (Int Int) Bool)
(declare-fun a () Int)

(assert (forall ((x Int))
                (=> (and (<= 0 x) (<= x 3))
                    (forall ((y Int))
                            (=> (and (<= 0 y) (<= y x))
                                (r x y))))))

(apply (then (! simplify :arith-lhs true :elim-and true) nnf normalize_bounded_quantifiers (! expand_bounded_quantifiers :domain 100)))

