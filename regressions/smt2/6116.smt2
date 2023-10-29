(set-option :model_validate true)
(set-info :status sat)

(declare-fun a () Float16)
(assert (= a ((_ to_fp 5 11) RTN 65535.0 0)))
(check-sat)