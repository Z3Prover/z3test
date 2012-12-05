

(declare-fun f (Int Int) Int)
(declare-fun p (Int) Bool)
(set-option :pp.max-depth 100)
(push)
(assert (or (forall ((x Int)) (=> (= x 10) (p x)))
            (= (forall ((x1 Int) (x2 Int)) (=> (= x1 (+ x2 1)) (p x1)))
               (p 20))))
(apply (and-then (! simplify :elim-and true) der))
(pop)

