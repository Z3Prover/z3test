
; Copyright (c) 2015 Microsoft Corporation
(set-option :auto-config true)
(set-option :produce-models true)
(declare-const a Int)
(assert (> a 2))
(check-sat)
(get-model)
