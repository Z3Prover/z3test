(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T2_31481 () (_ BitVec 16))
(declare-fun T1_31481 () (_ BitVec 8))
(declare-fun T1_31482 () (_ BitVec 8))
(assert (and true (= T2_31481 (bvor (bvshl ((_ zero_extend 8) T1_31482) (_ bv8 16)) ((_ zero_extend 8) T1_31481))) (not (= T2_31481 (_ bv1 16))) (not (= T2_31481 (_ bv2 16))) (= ((_ zero_extend 16) T2_31481) (_ bv1 32))))
(check-sat)
(exit)
