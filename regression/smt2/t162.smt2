

(declare-fun f (Int Int) Int)
(declare-fun p (Int) Bool)
(set-option :pp.max-depth 100)
(push)
(assert (forall ((x Int) (y Int)) (=> (and (= x (f x y)) (= y (f x y))) (= x y))))
(apply (and-then (! simplify :elim-and true) der))
(pop)


(push)
(assert (forall ((x1 Int) (x2 Int) (x3 Int) (x4 Int)) 
                (=> (and (= x1 0) (= x2 (ite (> x1 0) (f x2 x2) 1)) (= x3 (ite (= x2 1) 20 (f x3 x3))))
                    (p x3))))
(apply (and-then (! simplify :elim-and true) der))
(apply (repeat (and-then (! simplify :elim-and true) der) 1))
(apply (repeat (and-then (! simplify :elim-and true) der)))
(pop)

