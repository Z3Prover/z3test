(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_5 () (_ BitVec 8))
(assert (let ((?v_0 ((_ sign_extend 24) (bvsub T1_5 (_ bv48 8))))) (let ((?v_1 (bvadd ?v_0 ?v_0))) (let ((?v_2 (bvadd ?v_1 ?v_1))) (let ((?v_3 (bvadd ?v_2 ?v_0))) (and true (bvult ?v_3 ?v_0) (bvule (bvsub T1_5 (_ bv49 8)) (_ bv8 8)) (bvsle T1_5 (_ bv57 8)) (bvsle (_ bv48 8) T1_5) (not (= T1_5 (_ bv13 8))) (not (= T1_5 (_ bv10 8))) (not (= T1_5 (_ bv9 8))) (not (= T1_5 (_ bv32 8))) (not (= T1_5 (_ bv0 8))) (bvule (_ bv0 32) ?v_0) (bvule ?v_2 ?v_3)))))))
(check-sat)
(exit)
