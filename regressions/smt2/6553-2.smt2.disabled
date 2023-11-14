(set-option :model_validate true)
(set-info :status sat)

(declare-const x Real)
(declare-fun v () RoundingMode)
(assert (fp.gt (fp (_ bv0 1) (_ bv0 8) (_ bv0 23)) (fp.neg ((_ to_fp 8 24) v x))))
(check-sat)