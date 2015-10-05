
; Copyright (c) 2015 Microsoft Corporation


(set-option :produce-models true)
(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-fun f (Int) Int)
(assert (< x 0))
(assert (>= (f x) 20))
(assert (> (f 0) (f x)))
(check-sat)
(get-model)
(eval x)
(eval (+ x 10))
(eval (>= x (- x 1)))
(eval (f 0))
(eval (f (+ x 1)))
(eval (f (+ x 2)))
(eval y)
(eval y
      :model-completion true)
(eval y)
(eval z)
(eval (f (+ x y)))
(eval (f (+ x z)))
(eval (f (+ x 2))
      :max-steps 1)
