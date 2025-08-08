; Copyright (c) 2017 Microsoft Corporation
; issue #875
(declare-fun c0 () String)
(declare-fun c1 () String)
(declare-fun c2 () Int)
(assert (<= 0 (str.indexof c0 c1 c2)))
(assert (not (str.contains c0 c1)))
(assert (< c2 (str.len c0)))
(check-sat)
