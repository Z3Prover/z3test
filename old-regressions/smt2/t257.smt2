
(set-option :produce-proofs true)
(set-option :produce-models true)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (or (> a 1) (< a (- 1))))
(assert (> b (+ a 1)))
(assert (> c (+ a 2)))
(assert (> b (+ (* 2 c) 5)))

(apply (and-then (if-no-proofs occf) (if-no-proofs (! fm :fm-real-only false :fm-occ true))) :print-model-converter true)

(reset)

(set-option :produce-proofs false)
(set-option :produce-models true)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (or (> a 1) (< a (- 1))))
(assert (> b (+ a 1)))
(assert (> c (+ a 2)))
(assert (> b (+ (* 2 c) 5)))

(apply (and-then (if-no-proofs occf) (if-no-proofs (! fm :fm-real-only false :fm-occ true))) :print-model-converter true)


(reset)

(set-option :produce-models true)

(declare-const a Int)
(assert (= a (+ a 1)))

(apply (if-no-models simplify))
(set-option :produce-models false)
(apply (if-no-models simplify))
(apply (if-no-unsat-cores simplify))


(reset)

(set-option :produce-unsat-cores true)

(declare-const a Int)
(assert (! (= a (+ a 1)) :named ax1))

(apply (if-no-unsat-cores simplify))
