; Copyright (c) 2015 Microsoft Corporation

(set-logic QF_FP)
(set-info :status sat)

;; override model validation; it doesn't work with *-unspecified terms.
(set-option :model_validate false) 

(define-sort FPN () (_ FloatingPoint 11 53))
(declare-const x FPN)
(declare-const y FPN)

(assert (= x (fp.max (_ +zero 11 53) (_ -zero 11 53))))
(assert (= y (fp.max (_ -zero 11 53) (_ +zero 11 53))))
(assert (not (= x y)))

(check-sat)
(check-sat-using smt)
(exit)
