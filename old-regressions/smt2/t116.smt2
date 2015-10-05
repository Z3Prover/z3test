
; Copyright (c) 2015 Microsoft Corporation



(declare-const a1 Int)
(declare-const a2 Int)

(set-option :pp.max-depth 100)

(push)
(assert (>= (ite (= a1 10) a2 (+ a2 1)) 10))
(apply (and-then simplify elim-term-ite simplify))
(pop)
(echo "----------")


(push)
(assert (>= (ite (= a1 10) (ite (= a1 20) a2 0) (+ a2 1)) 10))
(apply (and-then simplify elim-term-ite simplify))
(pop)

(echo "----------")

(reset)

(assert (forall ((a1 Int) (a2 Int))
                (>= (ite (= a1 10) (ite (= a1 20) a2 0) (+ a2 1)) 10)))
(apply (and-then simplify elim-term-ite simplify))

