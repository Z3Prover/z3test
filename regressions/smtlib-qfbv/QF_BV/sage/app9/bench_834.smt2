(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T2_488 () (_ BitVec 16))
(declare-fun T1_488 () (_ BitVec 8))
(declare-fun T1_489 () (_ BitVec 8))
(assert (and true (= T2_488 (bvor (bvshl ((_ zero_extend 8) T1_489) (_ bv8 16)) ((_ zero_extend 8) T1_488))) (= T2_488 (_ bv0 16)) (not (= (bvadd (bvsub (_ bv0 32) ((_ zero_extend 24) (ite (bvult (_ bv32 16) T2_488) (_ bv1 8) (_ bv0 8)))) (_ bv1 32)) (_ bv0 32))) (not (= (bvadd (bvsub (_ bv0 32) ((_ zero_extend 24) (ite (bvult (_ bv64 16) T2_488) (_ bv1 8) (_ bv0 8)))) ((_ zero_extend 24) (_ bv1 8))) (_ bv0 32))) (bvule T2_488 (_ bv16 16)) (= T2_488 (_ bv16 16)) (not (= T2_488 (_ bv8 16)))))
(check-sat)
(exit)
