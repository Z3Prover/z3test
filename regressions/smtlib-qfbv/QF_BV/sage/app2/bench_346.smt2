(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_66 () (_ BitVec 8))
(declare-fun T1_65 () (_ BitVec 8))
(declare-fun T1_64 () (_ BitVec 8))
(assert (let ((?v_0 ((_ zero_extend 24) (_ bv8 8)))) (and true (not (= (bvand (bvor (bvshl (bvor (bvshl (bvor ((_ zero_extend 24) T1_64) (_ bv4294967040 32)) ?v_0) ((_ zero_extend 24) T1_65)) ?v_0) ((_ zero_extend 24) T1_66)) (_ bv4278190080 32)) (_ bv4278190080 32))))))
(check-sat)
(exit)
