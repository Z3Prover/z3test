

(declare-datatypes () ((T A B)))
(assert (is-A A))
(assert (is-B B))
(check-sat)
