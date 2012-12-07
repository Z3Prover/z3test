

(declare-const x Int)
(declare-const y Int)
(assert (>= x 3))
(assert (<= y 0))
(assert (>= (- x y) 3))
(assert (>= x (+ y 2)))
(apply propagate-ineqs)
(echo "Using simplifier...")
(apply (and-then simplify propagate-ineqs))
(echo "Using simplifier with arithmetic LHS normal form...")
(apply (and-then (! simplify :arith-lhs true) propagate-ineqs))


(apply (and-then (! simplify :arith-lhs true) (! add-bounds :add-bound-upper 10) propagate-ineqs))
