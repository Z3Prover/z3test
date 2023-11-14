(set-option :model_validate true)
(set-info :status unsat)

(set-logic ALL)
(declare-const c RoundingMode)
(declare-const x Float64)
(declare-sort T 0)
(declare-fun f (Float64) T)
(assert (not
	(=
		(f (fp.add c x (_ NaN 11 53)))
		(f (fp.add c (_ NaN 11 53) x)))))
(check-sat)