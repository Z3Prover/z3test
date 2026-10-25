(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_111348 () (_ BitVec 8))
(declare-fun T1_111383 () (_ BitVec 8))
(assert (let ((?v_3 (bvand (bvand ((_ zero_extend 24) T1_111348) (_ bv255 32)) (_ bv31 32)))) (let ((?v_1 (bvadd ?v_3 ((_ zero_extend 24) (_ bv1 8))))) (let ((?v_2 (bvadd ?v_1 (_ bv267 32))) (?v_0 (bvand (bvor (bvshl (bvand ((_ zero_extend 24) T1_111383) (_ bv255 32)) ((_ zero_extend 24) (_ bv5 8))) (_ bv27 32)) (_ bv127 32)))) (and true (bvslt (_ bv17 32) ?v_1) (bvslt (_ bv0 32) (bvadd ?v_0 (_ bv11 32))) (not (= ?v_0 (_ bv4294967295 32))) (bvsle ?v_2 (bvadd ?v_0 (_ bv161 32))) (bvslt (bvadd ?v_0 (_ bv160 32)) ?v_2) (bvsle (bvadd ?v_0 (_ bv147 32)) ?v_2) (bvslt (_ bv122 32) ?v_2) (bvsle (_ bv121 32) ?v_2) (bvsle (_ bv81 32) ?v_2) (bvslt (_ bv0 32) ?v_2) (not (= ?v_3 (_ bv4294967295 32))) (bvslt (_ bv16 32) ?v_1) (bvslt (_ bv0 32) ?v_1) (bvsle ?v_1 (_ bv30 32)))))))
(check-sat)
(exit)
