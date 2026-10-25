(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T2_10913 () (_ BitVec 16))
(declare-fun T1_10913 () (_ BitVec 8))
(declare-fun T1_10914 () (_ BitVec 8))
(assert (let ((?v_1 ((_ sign_extend 16) (bvadd (bvashr T2_10913 ((_ zero_extend 8) (_ bv9 8))) (_ bv1980 16))))) (let ((?v_0 (bvadd ?v_1 (_ bv4294965695 32)))) (and true (= T2_10913 (bvor (bvshl ((_ zero_extend 8) T1_10914) (_ bv8 16)) ((_ zero_extend 8) T1_10913))) (bvslt (bvadd (bvsub (bvsdiv ?v_0 (_ bv400 32)) (bvsdiv ?v_0 (_ bv100 32))) (bvmul ?v_0 (_ bv365 32))) (_ bv0 32)) (= (bvand ((_ extract 7 0) ?v_1) (_ bv3 8)) (_ bv0 8)) (bvule (bvsub ?v_1 (_ bv1601 32)) (_ bv29226 32))))))
(check-sat)
(exit)
