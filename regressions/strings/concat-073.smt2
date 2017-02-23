(set-logic QF_S)
(set-info :status sat)
(declare-const X String)
(declare-const Y1 String)
(declare-const Y2 String)
(declare-const Z String)
(declare-const M String)


(assert (= Z (str.++ X "gkhi" ) ) )
(assert (= Z (str.++ Y1 Y2   ) ) )
(assert (= Z (str.++ "abcd" M ) ) )


(check-sat)
(get-model)