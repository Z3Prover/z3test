
(declare-const v (-> Bool Bool))

(assert (forall ((va (-> Bool Bool))) (select va (= va v))))
(check-sat)
