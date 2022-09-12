(declare-fun a () Int)
(assert (= "B" (str.replace "B" "" (str.substr "A" 0 a))))
(check-sat)