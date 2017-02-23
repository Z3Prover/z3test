(set-logic QF_S)
(set-info :status unsat)
(declare-const x1 String)
(declare-const x2 String)
(declare-const y1 String)
(declare-const y2 String)
(declare-const z1 String)
(declare-const z2 String)

(declare-const b1 Bool)
(declare-const b2 Bool)
(declare-const b3 Bool)


(assert (= b1 (str.contains x1 "abc" ) ) )

(assert (= x1 "123bbaacc123") )

(assert b1)

(check-sat)
(get-model)
