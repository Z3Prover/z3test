; Regression: soundness with a recursively defined function under
; model_validate. The constraints are unsatisfiable.
; Transferred from src/test/fpa.cpp (test_recfun_defined_function_soundness).
(set-option :model_validate true)
(declare-fun fixedAdd () Int)
(declare-fun variableAdd () Int)
(define-fun-rec $$add$$ ((a Int) (b Int)) Int
  (ite (= 0 b) 2 (- a (+ 0 (- fixedAdd b)))))
(assert (= fixedAdd (* 9 fixedAdd)))
(assert (= 1 ($$add$$ 1 3)))
(check-sat)
