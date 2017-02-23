(set-logic QF_S)
(set-info :status sat)

(declare-const X String)
(declare-const Y String)

(assert (= (str.++ X Y) "abcdef"))

(assert (or (= X "abc") (= X "abcd")))
(assert (or (= Y "cdef") (= Y "ef")))

(check-sat)