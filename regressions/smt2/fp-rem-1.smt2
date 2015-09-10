(set-logic QF_FP)
(set-info :status sat)

(define-sort FPN () (_ FloatingPoint 11 53))
(declare-const x FPN)
(declare-const y FPN)
(declare-const r FPN)

(assert (= x (fp.rem (_ +zero 11 53) (fp #b0 #b01111111111 #x0000000000000))))

(check-sat)
(get-model)
