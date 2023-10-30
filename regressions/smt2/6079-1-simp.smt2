(set-option :model_validate true)
(set-info :status unsat)

(declare-fun r () (_ FloatingPoint 2 6))

(define-fun r1 () (_ FloatingPoint 2 6) ((_ to_fp 2 6) RTZ -3.25))
(define-fun a () (_ FloatingPoint 2 6) (_ -oo 2 6))

(assert
  (and
    (fp.eq r ((_ to_fp 2 6) RTZ 0.0625))
    (= a (fp.div RTZ r r1)))
)

(check-sat)