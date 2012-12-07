

(declare-const x Real)
(assert (= (* x x) 2.0))
(check-sat)
(get-model)

(reset)
(set-option :auto-config true)
(declare-const x Real)
(assert (= (* x x) 2.0))
(check-sat)
(get-model)
(set-option :pp.decimal true)
(get-model)