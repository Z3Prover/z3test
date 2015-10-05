
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const p4 Bool)
(assert (or (not p1) p2))
(check-sat p1)
(get-model)
(assert (not p2))
(check-sat)
(get-model)
(check-sat p1)
