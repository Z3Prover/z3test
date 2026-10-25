(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_9742 () (_ BitVec 8))
(declare-fun T1_9751 () (_ BitVec 8))
(assert (let ((?v_0 (bvand (bvand ((_ zero_extend 24) T1_9742) (_ bv255 32)) (_ bv31 32)))) (let ((?v_2 (bvadd ?v_0 ((_ zero_extend 24) (_ bv1 8))))) (let ((?v_3 (bvadd ?v_2 (_ bv277 32))) (?v_1 (bvand (bvor (bvshl (bvand ((_ zero_extend 24) T1_9751) (_ bv255 32)) ((_ zero_extend 24) (_ bv4 8))) (_ bv10 32)) (_ bv127 32)))) (and true (bvslt ?v_3 (bvadd ?v_1 (_ bv108 32))) (not (= ?v_0 (_ bv4294967295 32))) (bvslt (_ bv0 32) (bvadd ?v_1 (_ bv11 32))) (bvsle ?v_2 (_ bv30 32)) (not (= ?v_1 (_ bv4294967295 32))) (bvslt (_ bv0 32) ?v_3))))))
(check-sat)
(exit)
