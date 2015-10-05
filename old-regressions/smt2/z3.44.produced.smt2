
; Copyright (c) 2015 Microsoft Corporation
sat
(model 
  (define-fun e () Int
    3)
  (define-fun B ((x!1 Int)) Bool
    true)
  (define-fun A ((x!1 Int)) Bool
    false)
  (define-fun C ((x!1 Int)) Bool
    true)
  (define-fun D ((x!1 Int)) Bool
    (ite (= x!1 3) true
    (ite (= x!1 0) true
    (ite (= x!1 1) true
    (ite (= x!1 2) true
      (C x!1))))))
)
Is e an element of D?
true
Now proving that A is a strict subset of D
unsat
