(set-option :model_validate true)
(set-option :tactic.default_tactic smt)
(set-option :sat.euf true)
(set-info :status sat)

(declare-fun p () (_ FloatingPoint 2 3))
(declare-fun fp () (_ FloatingPoint 2 3))
(assert (fp.isNegative (fp.fma roundNearestTiesToEven fp p (fp (_ bv0 1) (_ bv0 2) (_ bv0 2)))))
(check-sat)