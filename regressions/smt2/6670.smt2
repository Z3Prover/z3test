(set-option :model_validate true)
(declare-fun i () Int)
(assert (> (rem i i) 0))
(check-sat)