; Copyright (c) 2017 Microsoft Corporation
; Issuue 949

(declare-const x String)

(assert (not (str.prefixof "prefix:" x)))

(assert (or
         (str.prefixof "prefix:a" x)
         (str.prefixof "prefix:b" x)
         (str.prefixof "prefix:c" x)))
(check-sat)
