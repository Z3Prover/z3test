(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y1 String)
(declare-const y2 String)


(assert (= x "abc\nefg  " ) )
(assert (= y1 "zzz" ) )


(check-sat)
(get-model)
