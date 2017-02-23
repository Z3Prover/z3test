(set-logic QF_S)
(set-info :status sat)
(declare-const str String)
(declare-const var1 Int)
(declare-const var2 Int)
(declare-const var3 Int)

(assert (= str "Hello world!" ) )
(assert (= var1 (str.lastindexof str "Hello") ) )
(assert (= var2 (str.lastindexof str "World") ) )
(assert (= var3 (str.lastindexof str "world") ) )


(check-sat)
(get-model)
