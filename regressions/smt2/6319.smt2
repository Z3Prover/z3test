(set-option :sat.euf true)
(set-option :tactic.default_tactic smt)
(assert (distinct (_ bv1 1) (_ bv0 1)))
(check-sat)
(reset)


(set-option :sat.euf true)
(set-option :tactic.default_tactic smt)
(assert (distinct false true))
(check-sat)