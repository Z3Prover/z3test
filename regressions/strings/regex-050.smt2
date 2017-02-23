(set-logic QF_S)
(set-info :status unsat)

(declare-const x String)
(declare-const y String)

(assert (= (str.len x) 2))
; (assert (str.in.re x (re.* (re.range "a" "b"))))
(assert (= x y))
(assert (str.in.re y (re.* (re.range "a" "b"))))
(assert (StartsWith x "1"))

(check-sat)
(get-model)
