
; Copyright (c) 2015 Microsoft Corporation


(set-option :diagnostic-output-channel "stdout")
(set-info :status unsat)

(declare-const x Int)
(assert (= x 1))
(check-sat-using smt)
;; (check-sat)