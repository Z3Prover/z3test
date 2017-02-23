(set-logic QF_S)
(set-info :status sat)
(declare-const some_condition Bool)
(declare-const t String)
(declare-const u String)

(assert (ite some_condition (= t "a") (= t "b") ) )
(assert (= u (str.replace "ab" t "z") ) )

(check-sat)
(get-model)