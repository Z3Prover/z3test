
; Copyright (c) 2015 Microsoft Corporation
(declare-const a Int)
(declare-const c Bool)

(simplify (<= 5 (ite c 0 a))
          :pull-cheap-ite true)

(simplify (<= (ite c 0 a) 5)
          :pull-cheap-ite true)
