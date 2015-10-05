
; Copyright (c) 2015 Microsoft Corporation
(declare-const a Int)
(declare-const b Int)
(assert (not (= (store (store ((as const (Array Int Int)) 1) 1 a) 2 b) 
                  (store ((as const (Array Int Int)) 1) 1 a))))
(check-sat)
