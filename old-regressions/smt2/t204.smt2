
; Copyright (c) 2015 Microsoft Corporation
(set-option :auto-config false)
(set-option :produce-models true)
(declare-const x Real)

(assert (= (^ x 2.0) 2.0))

(check-sat)
(get-model)
