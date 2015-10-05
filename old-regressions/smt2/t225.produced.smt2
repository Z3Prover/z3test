
; Copyright (c) 2015 Microsoft Corporation
sat
(model 
  (define-fun my_array () (Array Int Int)
    (_ as-array k!0))
  (define-fun my_function ((x!1 Int) (x!2 Int)) Int
    (ite (and (= x!1 0) (= x!2 1)) 2
    (ite (and (= x!1 1) (= x!2 0)) 3
      2)))
  (define-fun k!0 ((x!1 Int)) Int
    (ite (= x!1 3) 4
    (ite (= x!1 2) 4
      4)))
)
(((select my_array (my_function 0 1)) 4))
(((my_function 0 1) 2))
