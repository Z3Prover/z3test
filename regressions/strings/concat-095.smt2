(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y1 String)
(declare-const y2 String)


(assert (= x "abc\\nefg  " ) )
(assert (= y1 "z_\t_z-\\t-\\\\'=\\""_z" ) )


(check-sat)
(get-model)
