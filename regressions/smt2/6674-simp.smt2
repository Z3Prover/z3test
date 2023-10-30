(set-option :model_validate true)
(set-info :status sat)

(declare-fun x () (_ FloatingPoint 3 2))
(declare-fun r () (_ FloatingPoint 3 2))

(assert (fp.eq x (fp #b0 #b000 #b1)))

(assert (fp.eq
  r
  (fp.fma RTN x x (_ +zero 3 2))))

(assert (= (_ +zero 3 2) r))

;;(check-sat-using qe2)
(check-sat)
;; (get-model)


;; 0 000 1
;; 0 000 1.1 * 0 000 1.1