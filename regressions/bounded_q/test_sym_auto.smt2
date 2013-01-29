(declare-fun q (Int) Bool)
(declare-fun x () Int)

(assert (forall ((z Int)) (=> (and (< z (+ x 30)) (> z x)) (q z))))


(apply (then (! simplify :arith-lhs true) nnf expand_bounded_quantifiers))

