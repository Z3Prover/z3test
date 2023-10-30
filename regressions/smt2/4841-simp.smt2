(set-option :model_validate true)
(set-info :status unsat)

(define-fun X () (_ FloatingPoint 2 6) ((_ to_fp 2 6) RTZ -2.0))
(declare-fun Y () (_ FloatingPoint 2 6))
(define-fun Z () (_ FloatingPoint 2 6) ((_ to_fp 2 6) RTZ 0.03125))

(assert (fp.eq Y ((_ to_fp 2 6) RTZ -2.0625)))
(assert (= X (fp.div RTZ Y Z))) ;; -2.0 = -2.0625 / 0.03125 (= -66)

(check-sat)
