

(declare-const x Int)

(assert (>= x 0))
(assert (iff (and (>= x 1)
                  (iff false true))
             true))
(assert (= x 20))

(apply simplify)


(reset)

(set-option :produce-proofs true)

(declare-const x Int)

(assert (>= x 0))
(assert (iff (and (>= x 1)
                  (iff false true))
             true))
(assert (= x 20))

(apply simplify)
