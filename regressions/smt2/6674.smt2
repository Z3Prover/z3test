(set-option :model_validate true)
(set-info :status sat)

(declare-fun fp () (_ FloatingPoint 3 2))
(assert (= (fp (_ bv0 1) (_ bv0 3) (_ bv0 1)) (fp.fma roundNearestTiesToEven fp fp (fp (_ bv0 1) (_ bv0 3) (_ bv0 1)))))
(check-sat-using qe2)
(check-sat)
;; (get-model)