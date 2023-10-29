(set-option :model_validate true)
(set-info :status unsat)

(assert (= (fp (_ bv1 1) (_ bv0 5) (_ bv0 10)) ((_ to_fp 5 11) roundTowardZero (mkbv false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false true))))

(check-sat)