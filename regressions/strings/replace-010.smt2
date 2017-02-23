(set-logic QF_S)
(set-info :status sat)

(declare-const x String)

(declare-const y String)

(declare-const z String)


(assert (= y (str.replace x "'" "\\'")) )  ;replacing ‘ with \\' 

(assert (= z (str.replace x "p" "_p")) ) ; replacing the letter p with _p 


(check-sat) 

(get-model)