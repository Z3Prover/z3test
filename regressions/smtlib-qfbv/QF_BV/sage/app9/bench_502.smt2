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
(assert (let ((?v_0 ((_ zero_extend 16) T2_476))) (let ((?v_14 (bvmul ?v_0 ((_ zero_extend 24) (_ bv112 8)))) (?v_8 (bvadd ?v_0 ?v_0))) (let ((?v_13 (bvadd ?v_8 ?v_8)) (?v_1 (bvmul ?v_0 (_ bv8 32)))) (let ((?v_2 (bvadd ?v_1 ?v_1))) (let ((?v_3 (bvadd ?v_2 ?v_2)) (?v_12 (bvadd ?v_13 (_ bv32 32))) (?v_4 (bvmul ?v_0 (_ bv768 32)))) (let ((?v_5 (bvadd ?v_4 ?v_4))) (let ((?v_11 (bvadd ?v_5 ?v_5)) (?v_10 (bvadd ?v_3 ?v_3)) (?v_9 (bvadd ?v_3 (_ bv64 32)))) (let ((?v_7 (bvadd ?v_11 (_ bv32 32))) (?v_6 (bvadd ?v_10 (_ bv64 32)))) (and true (= T2_476 (bvor (bvshl ((_ zero_extend 8) T1_477) (_ bv8 16)) ((_ zero_extend 8) T1_476))) (= (bvmul ?v_0 (_ bv18 32)) (_ bv0 32)) (bvult (bvsub (_ bv136 32) ?v_6) (_ bv63 32)) (bvult (bvsub (_ bv3112 32) ?v_7) (_ bv63 32)) (bvult (bvsub (_ bv104 32) ?v_9) (_ bv63 32)) (bvult ?v_6 (_ bv2147483648 32)) (not (= ?v_6 (_ bv0 32))) (bvule ?v_6 (_ bv2147483647 32)) (bvult ?v_7 (_ bv2147483648 32)) (not (= ?v_7 (_ bv0 32))) (bvult (bvsub (_ bv48 32) ?v_12) (_ bv63 32)) (bvult ?v_9 (_ bv2147483648 32)) (not (= ?v_9 (_ bv0 32))) (bvule ?v_9 (_ bv2147483647 32)) (bvule (_ bv4 32) ?v_10) (bvult ?v_10 (_ bv256 32)) (not (= ?v_10 (_ bv0 32))) (bvule ?v_10 (_ bv4294967231 32)) (bvule ?v_11 (_ bv4294967263 32)) (not (= ?v_12 (_ bv0 32))) (bvule ?v_12 (_ bv2147483647 32)) (bvult (bvsub (_ bv16 32) ?v_13) (_ bv63 32)) (bvule (_ bv4 32) ?v_3) (bvult ?v_3 (_ bv256 32)) (not (= ?v_3 (_ bv0 32))) (bvule ?v_3 (_ bv4294967231 32)) (bvult (bvsub (_ bv120 32) ?v_14) (_ bv63 32)) (bvule ?v_13 (_ bv4294967263 32)) (bvule (_ bv4 32) ?v_13) (bvult ?v_13 (_ bv256 32)) (not (= ?v_13 (_ bv0 32))) (bvule ?v_13 (_ bv2147483647 32)) (bvult ?v_14 (_ bv2147483648 32)) (not (= ?v_14 (_ bv0 32))) (= (bvmul ?v_0 (_ bv2 32)) (_ bv2 32)) (bvsle ?v_0 (_ bv1 32)) (bvslt (_ bv0 32) ?v_0) (not (= T2_476 (_ bv2 16))) (not (= ?v_0 (_ bv2 32))) (bvule T2_476 (_ bv2 16)) (bvule ?v_0 (_ bv2 32)) (bvult ?v_0 (_ bv9 32)) (bvule T2_476 (_ bv32 16)) (bvult (_ bv0 16) T2_476) (not (= T2_476 (_ bv0 16)))))))))))))
(check-sat)
(exit)
