
; Copyright (c) 2015 Microsoft Corporation


(declare-datatypes () ((T A B)))
(assert (is-A A))
(assert (is-B B))
(check-sat)
