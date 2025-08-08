; Copyright (c) 2017 Microsoft Corporation
; issue #731
(declare-fun c0 () Int)
(assert (not (= c0 (str.to.int (int.to.str c0)))))
(check-sat)
