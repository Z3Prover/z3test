(set-option :model_validate true)
(set-info :status unsat)

(set-logic ALL)
(declare-const c RoundingMode)
(declare-const x Float64)
(assert (not (= (fp.add c x (_ NaN 11 53))
                (fp.add c (_ NaN 11 53) x))))
(check-sat)