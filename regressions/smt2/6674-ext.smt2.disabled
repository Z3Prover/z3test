(set-option :model_validate true)
(set-info :status sat)

(declare-fun fp () (_ FloatingPoint 8 24))
(declare-fun r () (_ FloatingPoint 8 24))
(assert (= r (fp.fma roundNearestTiesToEven fp fp (fp (_ bv0 1) (_ bv0 8) (_ bv0 23)))))
(assert (= (fp (_ bv0 1) (_ bv0 8) (_ bv0 23)) r))

(check-sat)
;; (get-model)

;   (define-fun fp () (_ FloatingPoint 8 24)
;     (fp #b1 #x28 #b00111001100010001110001))
