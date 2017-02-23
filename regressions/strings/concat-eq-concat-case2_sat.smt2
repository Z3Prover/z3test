(set-logic QF_S)
(set-info :status sat)

(declare-const X String)
(declare-const Y String)
(declare-const U String)

(assert (= (str.++ X Y) (str.++ U "def")))

(check-sat)
