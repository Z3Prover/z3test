
; Copyright (c) 2015 Microsoft Corporation
(set-option :auto-config true)
(set-option :produce-models true)

(declare-const a Int)
(assert (> (* a a) 3))
(check-sat)
(get-model)

(echo "Z3 will fail in the next example...")
(declare-const b Real)
(declare-const c Real)
(assert (= (+ (* b b b) (* b c)) 3.0))
(check-sat)

(echo "Z3 can solve some nontrivial nonlinear problems...")
(declare-const x Real)
(declare-const y Real)
(declare-const z Real)
(assert (= (* x x) (+ x 2.0)))
(assert (= (* x y) x))
(assert (= (* (- y 1.0) z) 1.0))
(check-sat)

(reset)

(set-logic QF_NIA)
(declare-const a Int)
(assert (> (* a a) 3))
(check-sat)

