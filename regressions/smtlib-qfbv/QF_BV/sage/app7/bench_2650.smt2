(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_10686 () (_ BitVec 8))
(declare-fun T1_10693 () (_ BitVec 8))
(declare-fun T1_10696 () (_ BitVec 8))
(assert (let ((?v_3 (bvand (bvand ((_ zero_extend 24) T1_10686) (_ bv255 32)) (_ bv31 32)))) (let ((?v_5 (bvadd ?v_3 ((_ zero_extend 24) (_ bv1 8))))) (let ((?v_7 (bvadd ?v_5 (_ bv267 32))) (?v_0 ((_ zero_extend 24) (_ bv2 8)))) (let ((?v_1 (bvand (bvor (bvshl (bvand ((_ zero_extend 24) T1_10693) (_ bv255 32)) ?v_0) (_ bv3 32)) (_ bv7 32)))) (let ((?v_8 (bvadd ?v_1 (_ bv26 32))) (?v_2 (bvand (bvshl (bvand ((_ zero_extend 24) T1_10696) (_ bv255 32)) ?v_0) (_ bv7 32)))) (let ((?v_4 (bvadd ?v_2 (_ bv3 32)))) (let ((?v_6 (bvadd ?v_4 ?v_8))) (and true (bvsle ?v_7 (bvadd ?v_6 (_ bv38 32))) (bvslt (_ bv0 32) (bvadd ?v_1 (_ bv3 32))) (not (= ?v_2 (_ bv4294967295 32))) (not (= ?v_1 (_ bv4294967295 32))) (not (= ?v_3 (_ bv4294967295 32))) (bvslt (_ bv0 32) ?v_4) (bvsle ?v_5 (_ bv30 32)) (bvsle (bvadd ?v_6 (_ bv37 32)) ?v_7) (bvslt ?v_6 ?v_7) (bvsle ?v_6 ?v_7) (bvslt ?v_8 ?v_7) (bvsle (bvadd ?v_1 (_ bv25 32)) ?v_7) (bvslt (_ bv0 32) ?v_7))))))))))
(check-sat)
(exit)
