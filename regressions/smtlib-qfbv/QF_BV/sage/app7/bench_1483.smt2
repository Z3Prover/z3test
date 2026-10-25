(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_10978 () (_ BitVec 8))
(assert (let ((?v_0 (bvand (bvand ((_ zero_extend 24) T1_10978) (_ bv255 32)) (_ bv7 32)))) (and true (bvsle ?v_0 (_ bv4 32)) (bvsle ?v_0 (_ bv8 32)) (bvsle ?v_0 (_ bv5 32)) (bvslt ?v_0 (_ bv6 32)) (bvsle (_ bv5 32) ?v_0) (bvsle (_ bv1 32) ?v_0) (bvslt (_ bv4 32) ?v_0))))
(check-sat)
(exit)
