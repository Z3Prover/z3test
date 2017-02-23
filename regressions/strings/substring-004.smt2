(set-logic QF_S)
(set-info :status sat)
(declare-const vi1 Int)
(declare-const vi2 Int)
(declare-const vi3 Int)
(declare-const vi4 Int)
(declare-const x String)


(assert (= "efg" (str.substr x vi1 vi2) ) )
(assert (= "bef" (str.substr x vi3 vi4) ) )



(check-sat)
(get-model)
