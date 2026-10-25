(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T2_10512 () (_ BitVec 16))
(declare-fun T1_10512 () (_ BitVec 8))
(declare-fun T1_10513 () (_ BitVec 8))
(assert (let ((?v_0 ((_ sign_extend 16) (bvashr T2_10512 ((_ zero_extend 8) (_ bv11 8)))))) (and true (= T2_10512 (bvor (bvshl ((_ zero_extend 8) T1_10513) (_ bv8 16)) ((_ zero_extend 8) T1_10512))) (bvslt (bvmul ?v_0 ((_ zero_extend 24) (_ bv60 8))) (_ bv0 32)) (bvule ?v_0 (_ bv23 32)))))
(check-sat)
(exit)
