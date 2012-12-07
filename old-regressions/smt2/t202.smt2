
(set-option :produce-models true)
(set-option :auto-config true)
(declare-fun a () Real) 
(assert (> 0.0 a))
(check-sat)
(get-model)
