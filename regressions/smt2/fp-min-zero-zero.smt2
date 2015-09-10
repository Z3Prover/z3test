(set-logic QF_FP)
(set-info :status unsat)

(define-sort FPN () (_ FloatingPoint 11 53))

(declare-const x FPN)
(declare-const y FPN)
(declare-const q FPN)
(declare-const r FPN)
(declare-const mpfx FPN)

(assert (= mpfx (fp.min (_ -zero 11 53) (_ +zero 11 53))))

(assert (= x (_ -zero 11 53)))
(assert (= y (_ +zero 11 53)))
(assert (= r (_ +zero 11 53)))
(assert (not (= (fp.min x y) r)))

(check-sat)
