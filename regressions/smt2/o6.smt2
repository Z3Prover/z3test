(declare-fun k () Int)
(assert (< (to_real k) 2))
(maximize k)
(check-sat)
