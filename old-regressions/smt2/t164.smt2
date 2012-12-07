

(declare-fun f (Int Int) Int)
(declare-fun p (Int) Bool)
(set-option :pp.max-depth 100)
(push)
(assert (forall ((x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
                (=> (= x5 (f x1 x2)) (p (f x5 (f x3 x4))))))  
(apply (and-then (! simplify :elim-and true) der))
(pop)

