(set-logic QF_S)
(set-info :status sat)
(declare-const i1 Int)
(declare-const i2 Int)
(declare-const Str1 String)
(declare-const Str2 String)


(assert (= Str1 "###ab") ) 
(assert (= i1 (str.indexof Str1 "##") ) )


(check-sat)
(get-model)
