
(set-option :pp.max-depth 20)
(declare-fun f (Int Int) Int)
(assert (or (forall ((X Int) (Y Int)) (and (> (f X X) 0) (= (f X Y) Y))) (= (f 0 0) 0)))
(assert (forall ((X Int) (Y Int)) (= (f X Y) 0)))
(apply distribute-forall)

(reset)
(set-option :pp.max-depth 20)
(declare-fun f (Int Int) Int)
(assert (or (forall ((X Int) (Y Int)) (not (or (not (> (f X X) 0)) (= (f X Y) Y)))) (> (f 0 0) 0))) 
(apply distribute-forall)
(apply (and-then distribute-forall simplify))
