(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)
(declare-const w String)
(declare-const m1 String)
(declare-const m2 String)
(declare-const m3 String)



(assert (= y (str.replace x "'" "\\'") ) )  
(assert (= z (str.replace x "p" "_p") ) ) 
(assert (= w (str.replace x "i" "_i") ) )
(assert (= m1 (str.replace x "k" "_k") ) )
(assert (= m2 (str.replace x "b" "_b") ) )
(assert (= m3 (str.replace x "ii" "_i_i") ) )

(assert (= (str.len x) 1))

(check-sat) 

(get-model)
