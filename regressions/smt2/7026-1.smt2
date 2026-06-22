(set-option :tactic.default_tactic smt)
(set-option :sat.euf true)
(set-info :status unsat)

(declare-fun a () Float32)
(assert (forall ((b Float32)) (not (fp.isPositive (fp.max a b)))))
(check-sat)