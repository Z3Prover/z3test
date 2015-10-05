
; Copyright (c) 2015 Microsoft Corporation


(declare-const a Int)
(declare-const b Int)

(simplify (<= a b))
(simplify (= a b))
(simplify (<= a b) :arith-lhs true)
(simplify (= a b)  :arith-lhs true)
(simplify (<= a b) :ineq-lhs true)
(simplify (= a b)  :ineq-lhs true)
(simplify (<= a b) :ineq-lhs true :arith-lhs true)
(simplify (= a b)  :ineq-lhs true :arith-lhs true)