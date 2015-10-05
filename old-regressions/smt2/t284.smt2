
; Copyright (c) 2015 Microsoft Corporation



(set-option :auto-config true)
(declare-const x Int)
(declare-const y Int)

(assert (>= (+ (* x x) (* y y)) 4))
(assert (> x 0))
(assert (> y 0))
(check-sat)
(get-model)