(set-logic QF_S)
(set-info :status sat)
(declare-const x1 String)
(declare-const x2 String)
(declare-const y1 String)
(declare-const y2 String)
(declare-const z1 String)
(declare-const z2 String)

(declare-const b1 Bool)
(declare-const b2 Bool)
(declare-const b3 Bool)


(assert (= b1 (str.contains x1 y1 ) ) )

(assert (= x1 "123abc123") )

(assert (= y1 "abc") )

(assert b1)

(check-sat)
(get-model)
