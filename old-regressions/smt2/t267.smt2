
; Copyright (c) 2015 Microsoft Corporation

(set-option :pp.max-depth 20)
(declare-fun f (Int Int) Int)
(assert (or (forall ((X Int) (Y Int)) (! (and (> (f X X) 0) (= (f X Y) Y)) :pattern (f X Y))) (= (f 0 0) 0)))
(assert (forall ((X Int) (Y Int)) (= (f X Y) 0)))
(apply distribute-forall)
