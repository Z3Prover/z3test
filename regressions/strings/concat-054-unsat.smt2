(set-logic QF_S)
(set-info :status unsat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ "abkefgh" x) (str.++ "abc" y) ) )

(check-sat)
(get-model)