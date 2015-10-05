
; Copyright (c) 2015 Microsoft Corporation


(declare-const x Int)
(declare-const y Int)

(assert (or (> x 0) (< x 0)))
(assert (= y (+ x 1)))
(assert (= y 1))

(apply (then simplify (par-then split-clause simplify)))

(apply (then simplify (par-then split-clause (then simplify solve-eqs))))

(reset)

(set-option :produce-unsat-cores true)
(set-logic QF_UF)
(declare-fun p () Bool)
(declare-fun q () Bool)
(declare-fun r () Bool)
(declare-fun s () Bool)
(declare-fun t () Bool)
(assert (! (=> p q) :named PQ))
(assert (! (=> q r) :named QR))
(assert (! (=> r s) :named RS))
(assert (! (=> s t) :named ST))
(assert (! (not (=> q s)) :named NQS))
(check-sat)
(get-unsat-core)

(echo "unsat-core example")
(apply (then simplify propagate-values))
(apply (then simplify (par-then split-clause propagate-values)))
;; split-clause will split clause PQ, thus PQ is in the core even if it is not really needed
(check-sat-using (then simplify (par-then split-clause propagate-values)))
(get-unsat-core)

