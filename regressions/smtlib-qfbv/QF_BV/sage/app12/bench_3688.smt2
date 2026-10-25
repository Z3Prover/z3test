(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-info :source |
 Patrice Godefroid, SAGE (systematic dynamic test generation)
 For more information: http://research.microsoft.com/en-us/um/people/pg/public_psfiles/ndss2008.pdf
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun T1_11135 () (_ BitVec 8))
(assert (let ((?v_0 ((_ zero_extend 24) T1_11135))) (and true (= (bvadd ?v_0 (_ bv4294967264 32)) (_ bv91 32)) (bvule (bvsub ?v_0 (_ bv97 32)) (_ bv25 32)) (not (= T1_11135 (_ bv0 8))))))
(check-sat)
(exit)
