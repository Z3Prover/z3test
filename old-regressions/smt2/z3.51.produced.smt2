
; Copyright (c) 2015 Microsoft Corporation
sat
(model 
  (define-fun n () Int
    1)
  (define-fun a_1 () Int
    1)
  (define-fun k!2 ((x!1 Int)) Int
    (ite (>= x!1 0) (ite (>= x!1 1) (ite (>= x!1 2) 2 1) 0) (- 1)))
  (define-fun g_1!3 ((x!1 Int)) Int
    (ite (= x!1 2) 1
      0))
  (define-fun g_1 ((x!1 Int)) Int
    (g_1!3 (k!2 x!1)))
  (define-fun f!4 ((x!1 Int)) Int
    (ite (= x!1 2) 2
    (ite (= x!1 1) 1
      0)))
  (define-fun f ((x!1 Int)) Int
    (f!4 (k!2 x!1)))
)
Property does not hold for n > 1
unsat
