(set-logic QF_FP)
(set-info :status sat)

(declare-fun my_rm_uf_rmb (RoundingMode) Bool)
(assert (= (my_rm_uf_rmb RTP) true))
(assert (= (my_rm_uf_rmb RTN) false))

(check-sat)
(exit)
