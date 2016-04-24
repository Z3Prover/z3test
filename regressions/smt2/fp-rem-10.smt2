;; Copyright (c) 2015 Microsoft Corporation

(set-logic QF_FP)
(set-info :source |Handcrafted by C.M. Wintersteiger from a bug repro by Florian Schanda; GitHub Issue #508|)
(set-info :smt-lib-version 2.5)
(set-info :category crafted)
(set-info :status unsat)

(define-fun a () Float32 (fp #b0 #b00000000 #b00000000000000000000111))
(define-fun b () Float32 (fp #b0 #b00000000 #b00000000000000000000100))

(declare-fun r () Float32)

(assert (= r (fp.rem a b)))
(assert (not (= r (fp #b1 #b00000000 #b00000000000000000000001))))

(check-sat)
(check-sat-using smt)
(check-sat-using (then
                     fpa2bv
                     (using-params simplify :elim_and true)
                     bit-blast
                     sat))
(exit)
