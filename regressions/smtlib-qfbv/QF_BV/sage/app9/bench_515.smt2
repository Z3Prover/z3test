(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T2_476 () (_ BitVec 16))
(declare-fun T1_476 () (_ BitVec 8))
(declare-fun T1_477 () (_ BitVec 8))
(assert (let ((?v_0 ((_ zero_extend 16) T2_476))) (let ((?v_1 (bvadd ?v_0 ?v_0))) (let ((?v_8 (bvadd ?v_1 ?v_1)) (?v_2 (bvmul ?v_0 (_ bv8 32)))) (let ((?v_3 (bvadd ?v_2 ?v_2))) (let ((?v_4 (bvadd ?v_3 ?v_3))) (let ((?v_7 (bvadd ?v_4 ?v_4)) (?v_6 (bvadd ?v_4 (_ bv64 32)))) (let ((?v_5 (bvadd ?v_7 (_ bv64 32)))) (and true (= T2_476 (bvor (bvshl ((_ zero_extend 8) T1_477) (_ bv8 16)) ((_ zero_extend 8) T1_476))) (bvult (_ bv4294967263 32) ?v_8) (bvult (bvsub (_ bv136 32) ?v_5) (_ bv63 32)) (bvult (bvsub (_ bv104 32) ?v_6) (_ bv63 32)) (bvult ?v_5 (_ bv2147483648 32)) (not (= ?v_5 (_ bv0 32))) (bvule ?v_5 (_ bv2147483647 32)) (bvult ?v_6 (_ bv2147483648 32)) (not (= ?v_6 (_ bv0 32))) (bvule ?v_6 (_ bv2147483647 32)) (bvule (_ bv4 32) ?v_7) (bvult ?v_7 (_ bv256 32)) (not (= ?v_7 (_ bv0 32))) (bvule ?v_7 (_ bv4294967231 32)) (bvule (_ bv4 32) ?v_4) (bvult ?v_4 (_ bv256 32)) (not (= ?v_4 (_ bv0 32))) (bvule ?v_4 (_ bv4294967231 32)) (= (bvmul ?v_0 (_ bv2 32)) (_ bv2 32)) (bvsle ?v_0 (_ bv1 32)) (bvslt (_ bv0 32) ?v_0) (not (= T2_476 (_ bv2 16))) (not (= ?v_0 (_ bv2 32))) (bvule T2_476 (_ bv2 16)) (bvule ?v_0 (_ bv2 32)) (bvult ?v_0 (_ bv9 32)) (bvule T2_476 (_ bv32 16)) (bvult (_ bv0 16) T2_476) (not (= T2_476 (_ bv0 16))) (bvult (bvsub (_ bv16 32) ?v_8) (_ bv63 32)) (bvule (_ bv4 32) ?v_8) (bvult ?v_8 (_ bv256 32)) (not (= ?v_8 (_ bv0 32))) (bvule ?v_8 (_ bv2147483647 32)))))))))))
(check-sat)
(exit)
