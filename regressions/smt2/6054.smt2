(set-option :model_validate true)

(declare-fun v () Int)
(declare-fun a () Int)
(assert (distinct true (= "" (str.replace (str.substr "A" 0 a) "" (str.substr "A" 0 v)))))
(check-sat)
(reset)

(set-logic ALL)
(declare-fun v () Int)
(declare-fun a () Int)
(assert (= "" (str.replace (str.substr "A" 0 v) "" (str.substr "A" 0 a))))
(check-sat)