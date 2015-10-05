
; Copyright (c) 2015 Microsoft Corporation


(set-option :produce-models true)
(declare-const a Int)
(declare-const b Int)

(assert (<= a 10))
(assert (<= 0 a))
(assert (<= (+ a b) 3))

(apply lia2pb)
(apply (! lia2pb :lia2pb-partial true))

(assert (<= b 3))
(assert (<= 0 b))
(assert (not (= a b)))
(apply lia2pb)
(check-sat-using (and-then lia2pb smt))
(get-model)

(assert (= (* a a) 4))
(apply lia2pb)
(apply (skip-if-failed lia2pb))

(reset)

(set-option :produce-unsat-cores true)
(declare-const a Int)
(declare-const b Int)

(assert (! (<= a 10)      :named ax1))
(assert (! (<= 0 a)       :named ax2))
(assert (! (<= (+ a b) 3) :named ax3))
(assert (! (<= b 3)       :named ax4))
(assert (! (<= 0 b)       :named ax5))
(assert (! (not (= b 3))  :named ax6))
(assert (! (not (= b 4))  :named ax7))
(assert (! (not (= a 2))  :named ax8))

(apply (and-then solve-eqs lia2pb) :print-dependencies true)

