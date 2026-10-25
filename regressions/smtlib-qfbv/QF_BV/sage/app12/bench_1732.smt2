(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_11088 () (_ BitVec 8))
(assert (let ((?v_0 ((_ sign_extend 8) T1_11088))) (let ((?v_1 (not (= ?v_0 (_ bv46 16))))) (and true (= ?v_0 (_ bv47 16)) (not (= ?v_1 (not true))) (not (= T1_11088 (_ bv92 8))) (not (= T1_11088 (_ bv47 8))) ?v_1))))
(check-sat)
(exit)
