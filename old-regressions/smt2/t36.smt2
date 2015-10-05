
; Copyright (c) 2015 Microsoft Corporation
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const r1 Real)
(declare-const r2 Real)
(set-option :pp.flat-assoc false)


(simplify (- 0 a))
(simplify (+ 0 a))
(simplify (+ a 0))
(simplify (to_int 2.1))
(simplify (to_real 1))
(simplify (to_int (to_real 1)))
(simplify (to_int (to_real a)))
(simplify (to_real (to_int r1)))
(simplify (is_int r1))
(simplify (is_int 2.0))
(simplify (is_int 2.1))
(simplify (is_int (to_real a)))


