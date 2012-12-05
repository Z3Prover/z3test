(declare-const x1 Int)
(declare-fun f (Int) Int)
(assert
  (and
   (= (* x1 x1) 1)
   (= (f x1) 1)
   (= (f 1)  0)
   (= (f (- 1)) 0)
   ))
(check-sat)

