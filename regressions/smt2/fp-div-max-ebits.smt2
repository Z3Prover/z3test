; FP(63,2) exercises the largest exponent width accepted by the AST layer.
(set-logic QF_FP)
(set-info :status unsat)
(declare-fun x () (_ FloatingPoint 63 2))
(define-fun one () (_ FloatingPoint 63 2)
  (fp #b0 #b011111111111111111111111111111111111111111111111111111111111111 #b0))
(assert (and
  (fp.eq x one)
  (not (= (fp.div RNE x x) one))))
(check-sat-using qffp)
