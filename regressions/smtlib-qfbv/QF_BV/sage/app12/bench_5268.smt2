(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_2 () (_ BitVec 8))
(assert (let ((?v_1 ((_ zero_extend 24) T1_2)) (?v_4 ((_ zero_extend 8) T1_2))) (let ((?v_3 (bvsub ?v_1 (_ bv65 32))) (?v_2 (bvadd ?v_1 (_ bv4294962944 32))) (?v_0 (bvadd ?v_1 (_ bv21504 32)))) (and true (bvule (_ bv13312 16) ?v_4) (bvult ((_ zero_extend 16) (_ bv11171 16)) (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_0)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_0)) (_ bv8 32)))) (bvult ((_ zero_extend 16) (_ bv249 16)) (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_2)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_2)) (_ bv8 32)))) (bvult ((_ zero_extend 16) (_ bv25 16)) (bvadd ((_ zero_extend 24) ((_ extract 7 0) ?v_3)) (bvshl ((_ zero_extend 24) ((_ extract 15 8) ?v_3)) (_ bv8 32)))) (not (= (bvand (bvsub ?v_1 (_ bv33 32)) (_ bv4294967264 32)) (_ bv0 32))) (= (bvand T1_2 (_ bv128 8)) (_ bv0 8)) (bvult ?v_4 (_ bv57344 16)) (bvult ?v_4 (_ bv65280 16)) (bvult ?v_4 (_ bv65072 16)) (bvult ?v_4 (_ bv63744 16)) (bvult ?v_4 (_ bv59413 16)) (bvult ?v_4 (_ bv19968 16)) (bvult ?v_4 (_ bv44032 16)) (bvult ?v_4 (_ bv4352 16)) (bvult ?v_4 (_ bv12288 16)) (bvult ?v_4 (_ bv12593 16)) (bvsle ?v_1 (_ bv8 32)) (not (= ?v_1 (_ bv7 32))) (not (= ?v_1 (_ bv32 32))) (bvsle ?v_1 (_ bv32 32)) (bvult ?v_4 (_ bv97 16)) (bvslt ?v_1 (_ bv9 32)) (bvsle ?v_1 (_ bv126 32)) (not (= ?v_1 (_ bv10 32))) (not (= ?v_1 (_ bv13 32)))))))
(check-sat)
(exit)
