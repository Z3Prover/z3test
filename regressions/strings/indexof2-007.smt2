(set-logic QF_S)
(set-info :status sat)
(declare-const i1 Int)
(declare-const i2 Int)
(declare-const Str1 String)
(declare-const Str2 String)

(assert (= i1 (Indexof2 "#" "##" i2) ) )

(assert (not (= i1 i2) ) )


(check-sat)
(get-model)
