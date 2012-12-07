
(set-option :diagnostic-output-channel "stdout")
(declare-const a Int)
(declare-const b Int)

(assert (= (+ a b) 1))
(assert (> a 10))
(assert (< a 20))

(apply (echo "size: " size " num-exprs: " num-exprs " is-lia: " is-qflia) :print false)