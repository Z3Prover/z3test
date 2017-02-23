(set-logic QF_S)
(set-info :status unsat)
(set-option :auto-config true)
(set-option :produce-models true)

(declare-const a String)
(declare-const b String)
(declare-const z String)

(assert (= (str.++ a "testhello") "hello"))

(check-sat)
(get-model)