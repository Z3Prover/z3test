

(declare-sort S)
(declare-const a S)
(declare-const b S)
(declare-const c S)
(declare-fun f (S) S)
(declare-const v S)

(assert (distinct a b c))
(assert (or (= v a) (= v b) (= v c)))
(apply symmetry-reduce)