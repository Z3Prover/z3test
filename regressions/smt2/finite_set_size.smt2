(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)

(assert (= (set.size s) 1))
(assert (set.subset s t))
(assert (not (= (set.size (set.difference t s)) (- (set.size t) 1))))
(check-sat)