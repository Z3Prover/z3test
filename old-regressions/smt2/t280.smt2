
; Copyright (c) 2015 Microsoft Corporation
(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)

(assert (and a (or b (and d a))))

(apply simplify)
(apply ctx-solver-simplify)
