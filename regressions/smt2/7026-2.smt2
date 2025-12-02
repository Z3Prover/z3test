(set-option :model_validate true)
(set-option :tactic.default_tactic smt)
(set-option :sat.euf true)
(set-info :status sat)

(assert (=
  ((_ to_fp 5 11) roundTowardNegative (concat (_ bv0 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1)))
  ((_ to_fp 5 11) roundTowardNegative (concat (_ bv0 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1) (_ bv1 1)))
  ))
(check-sat)