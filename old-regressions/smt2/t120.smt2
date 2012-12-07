

(declare-const a1 Int)
(declare-const a2 Int)
(declare-const a3 Int)
(declare-const p1 Bool)
(declare-const p2 Bool)

(assert (>= a1 0))
(assert (or p1 p2))
(assert (or p1 (>= a1 1)))
(assert (or p2 (>= a1 2) p1 (>= a1 3)))
(assert (or (>= a1 4) (>= a1 5) (>= a1 6)))
(assert (or (not p2) (>= a1 2) p1 (>= a1 3)))
(assert (or (not p2) (not (>= a1 2)) p1 (not (>= a1 3))))
(assert (or (not p2) (not (>= a1 2)) p1 (not (>= a1 3)) (>= a1 10)))
(assert (or (not p2) (>= a1 2) p1 (>= a1 3) (not (>= a1 10))))
(assert (or (not p2) (>= a1 2) p1 (>= a1 3) (>= a1 10)))

(apply occf)