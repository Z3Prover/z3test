
(declare-const x Real)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)

(assert (is_int x))
(assert (= (div a b) c))
(assert (= (mod a b) d))
(assert (= (div a b) e))
(assert (= (div a b) (to_int x)))
(assert (> (rem a b) 0))

(apply purify-arith)
