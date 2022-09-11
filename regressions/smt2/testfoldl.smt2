(push)
(declare-fun f (Int Int) Int)
(declare-const il (Seq Int))
(assert (= (seq.foldl f 0 il) 5))
(check-sat)
(pop)

(push)
(declare-const il (Seq Int))
(declare-const F (Array Bool Int Bool))
(assert (= (seq.foldl F true il) true))
(assert (> (seq.len il) 0))
(assert (not (= F ((as const (Array Bool Int Bool)) true))))
(check-sat)
(pop)


(push)
(declare-fun f (Int Int Int) Int)
(declare-const il (Seq Int))
(assert (= (seq.foldli f 0 0 il) 5))
(check-sat)
(pop)

(push)
(declare-const il (Seq Int))
(declare-const F (Array Int Bool Int Bool))
(assert (= (seq.foldli F 5 true il) true))
(assert (> (seq.len il) 0))
(assert (not (= F ((as const (Array Int Bool Int Bool)) true))))
(check-sat)
(pop)


