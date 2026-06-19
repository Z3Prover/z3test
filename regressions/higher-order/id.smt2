(declare-sort A)
(assert (forall ((S (-> A A))) (exists ((x A)) (not (= x (S x))))))
(check-sat)