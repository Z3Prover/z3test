

(declare-datatypes () ((T A B)))
(declare-const x T)
(assert (is-A x))
(assert (is-B x))
(check-sat)
