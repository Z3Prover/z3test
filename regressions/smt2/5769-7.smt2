(declare-fun a () RoundingMode)
(declare-fun b () Float64)
(declare-fun c () Float64)
(check-sat)
(assert (= c b ((_ to_fp 11 53) a 1.6)))
(check-sat)
(get-value (a))
(get-value (b))
(get-value (c))