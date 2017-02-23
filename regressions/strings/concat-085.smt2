(set-logic QF_S)
(set-info :status sat)
(declare-const y2 String)
(declare-const t_str5 String)
(declare-const m2 String)
(declare-const t_str2 String)
(declare-const z String)



(assert (= z (str.++ "ef" y2) ) )
(assert (= z (str.++ t_str5 (str.++ "ce" m2)) ) )
(assert (= z (str.++ t_str2 "abc@") ) )






(check-sat)
(get-model)