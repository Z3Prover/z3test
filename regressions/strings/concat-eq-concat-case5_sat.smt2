(set-logic QF_S)
(set-info :status sat)

(declare-const X String)
(declare-const U String)

(assert (= (str.++ X "cdef") (str.++ U "def")))

(check-sat)
