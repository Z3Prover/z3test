
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (or (> a 1) (< a (- 1))))
(assert (> b (+ a 1)))
(assert (> c (+ a 2)))
(assert (> b (+ (* 2 c) 5)))

(apply (and-then occf (! fm :fm-real-only false :fm-occ true)) :print-model-converter true)

(check-sat-using (and-then occf (! fm :fm-real-only false :fm-occ true)))
(get-model)

(reset)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (! (> a (+ b 1)) :named ax1))
(assert (! (< a 0) :named ax2))
(assert (! (> b 1) :named ax3))
(assert (! (> c (+ a 2)) :named ax4))
(assert (! (> c (+ a 3)) :named ax5))
(check-sat-using (and-then propagate-values (! fm :fm-real-only false)))
(get-unsat-core)


(reset)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)

(set-option :pp.max-depth 20)
(assert (! (> a (+ b 1)) :named ax1))
(assert (! (> d a) :named ax2))
(assert (! (> c (+ a 2)) :named ax3))
(assert (! (> c (+ a 3)) :named ax4))
(assert (! (or (> c b) (< c b)) :named ax5))
(assert (! (or (> c d) (< c d)) :named ax6))
(apply (and-then solve-eqs skip) :print-dependencies true)
(apply (and-then solve-eqs (! fm :fm-real-only false)) :print-dependencies true :print-model-converter true)

