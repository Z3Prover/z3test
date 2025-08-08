
(set-info :status sat)
(declare-fun tmp_int2 () Int)
(assert
 (= (str.indexof "" "" tmp_int2) (- 1)))
(check-sat)

