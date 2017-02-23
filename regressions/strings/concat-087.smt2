(set-logic QF_S)
(set-info :status sat)
(declare-const X String)
(declare-const Y String)

(assert (= (str.++ X (str.++ "ab" Y ) ) (str.++ Y (str.++ "ba" X ) ) ) )
(assert (= 2 (str.len X) ) )

(check-sat)
(get-model)