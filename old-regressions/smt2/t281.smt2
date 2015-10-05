
; Copyright (c) 2015 Microsoft Corporation
(push)
(declare-const p1 Bool)
(declare-const p2 Bool)
(assert (exists ((a Bool) (b Bool)) (or (and p1 a) (and p2 (not b)))))
(apply qe)
(pop)

(push)
(assert (forall ((x Int) (y Int)) (or (= x 0) (< (* 5 y) (* 6 x)) (> (* 5 y) (* 6 x)))))
(apply qe)
(pop)

(push)
(assert (forall ((a Int) (b Int)) (exists ((x Int)) (and (< a (* 20 x)) (< (* 20 x) b)))))
(apply qe)
(pop)


(push)
(declare-sort U)
(declare-fun f (U) U)
(assert (exists ((u U)) (= (f u) u)))
(apply qe)
(pop)


(push)
(assert (exists ((l Int)) (forall ((x Int)) (implies (>= x l) 
                (exists ((u Int) (v Int)) (and (>= u 0) (>= v 0) (= x (+ (* 3 u) (* 7 v)))))))))
(apply qe)
(pop)


(push)
(assert (forall ((x Int) (y Int)) (implies (= (* 6 x) (* 5 y)) (exists ((d Int)) (= y (* 3 d))))))
(apply qe)
(pop)

(push)
(declare-const a Int)
(assert (exists ((x Int)) (= (- a (mod x 4)) 0)))
(apply qe)
(pop)


(push)
    (assert (forall ((x Int) (q1 Int) (q2 Int) (r1 Int) (r2 Int))
                   (implies 
                     (and (< x 4699) 
                          (= (* 2622 x) (+ (* 65536 q1) r1)) 
                          (<= 0 q1) 
                          (<= 0 r1) 
                          (< r1 65536) 
                          (= x (+ (* 100 q2) r2)) 
                          (<= 0 q2) 
                          (<= 0 r2) 
                          (< r2 100)) 
                          (= q1 q2))))
(apply qe)
(pop)

(push)
(assert (forall ((l (List Int))) (or (= l nil) (exists ((x Int) (ll (List Int))) (= l (insert x ll))))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Real)) (forall ((y Real)) (>= x y))))
(apply qe)
(pop)
(push)
    (assert (exists ((x Real)) (forall ((y Real)) (> x y))))
(apply qe)
(pop)
(push)
    (assert (exists ((x Real)) (forall ((y Real)) (< x y))))
(apply qe)
(pop)
(push)
    (assert (exists ((x Real)) (forall ((y Real)) (<= x y))))
(apply qe)
(pop)
(push)

    (assert (exists ((x Real)) (exists ((y Real)) (< x y))))
(apply qe)
(pop)
(push)
    (assert (exists ((x Real)) (exists ((y Real)) (<= x y))))
(apply qe)
(pop)
(push)
    (assert (exists ((x Real)) (exists ((y Real)) (>= x y))))
(apply qe)
(pop)
(push)
    (assert (exists ((x Real)) (exists ((y Real)) (> x y))))
(apply qe)
(pop)
(push)

    (assert (forall ((x Real)) (exists ((y Real)) (< x y))))
(apply qe)
(pop)
(push)
    (assert (forall ((x Real)) (exists ((y Real)) (<= x y))))
(apply qe)
(pop)
(push)
    (assert (forall ((x Real)) (exists ((y Real)) (>= x y))))
(apply qe)
(pop)
(push)
    (assert (forall ((x Real)) (exists ((y Real)) (> x y))))
(apply qe)
(pop)
(push)

    (assert (forall ((x Real)) (forall ((y Real)) (< x y))))
(apply qe)
(pop)
(push)
    (assert (forall ((x Real)) (forall ((y Real)) (<= x y))))
(apply qe)
(pop)
(push)
    (assert (forall ((x Real)) (forall ((y Real)) (>= x y))))
(apply qe)
(pop)
(push)
    (assert (forall ((x Real)) (forall ((y Real)) (> x y))))
(apply qe)
(pop)

(push)
    (assert (exists ((l Int)) (forall ((x Int)) (implies (>= x l) 
                        (exists ((u Int) (v Int)) (and (>= u 0) (>= v 0) (= x (+ (* 3 u) (* 5 v)))))))))
(apply qe)
(pop)
(push)


    (assert (forall ((d Int)) (implies (>= d 0) (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= d (+ (* 3 x) (* 5 y))))))))
(apply qe)
(pop)
(push)

    (assert (forall ((y Int)) (implies (exists ((d Int)) (= y (* 6 d))) (exists ((d Int)) (= y (* 2 d))))))
(apply qe)
(pop)
(push)

    (assert (forall ((y Int)) (implies (exists ((d Int)) (= y (* 65 d))) (exists ((d Int)) (= y (* 5 d))))))
(apply qe)
(pop)
(push)


    (assert (exists ((z Int)) (forall ((w Int)) (exists ((x Int) (y Int))
                   (or (and (< (+ (* 3 x) w) 2) (< 1 (- (+ (* 2 x) z) w))) 
                       (and (< z (* 2 y)) (> z y)))))))

(apply qe)
(pop)
(push)

    (assert (exists ((x Int) (y Int)) (and (> x 0) (>= y 0) (= 1 (- (* 3 x) (* 5 y))))))
(apply qe)
(pop)
(push)


    (assert (exists ((a Int) (b Int))
                   (and (not (= a 1)) (= a b) (or (= a (* 2 b)) (= (* 2 b) (+ 1 (* 3 a)))))))
(apply qe)
(pop)
(push)


    (assert (forall ((x Int)) (iff (and (not (= 0 (mod x 2))) (= 0 (mod (- x 1) 3))) 
                                         (or (= 0 (mod (- x 1) 12)) (= 0 (mod (- x 7) 12))))))

(apply qe)
(pop)

(push)
    (assert (exists ((x Int)) (and (< (* 3 x) 2) (< 1 (* 2 x)))))
(apply qe)
(pop)
(push)
    (assert (forall ((x Int) (y Int)) (or (= 0 (mod x 5))                (not (= (* 6 x) (* 5 y))))))
(apply qe)
(pop)
(push)
    (assert (forall ((x Int)) (exists ((y Int)) (= x (* 2 y)))))
(apply qe)
(pop)
(push)
    (assert 
                 (forall ((x Int)) 
                   (implies (not (= 0 (mod x 2))) 
                        (or (= 0 (mod (- x 1) 4)) 
                            (= 0 (mod (- x 1) 8)) 
                            (= 0 (mod (- x 3) 8)) 
                            (= 0 (mod (- x 1) 6)) 
                            (= 0 (mod (- x 1) 14)) 
                            (= 0 (mod (- x 9) 14)) 
                            (= 0 (mod (- x 11) 14)) 
                            (= 0 (mod (- x 5) 24)) 
                            (= 0 (mod (- x 11) 24))))) )
(apply qe)
(pop)
(push)

(assert 
                 (forall ((x Int)) (iff (and (not (= 0 (mod x 2))) (= 0 (mod (- x 1) 3))) 
                                         (or (= 0 (mod (- x 1) 12)) (= 0 (mod (- x 7) 12))))))
    
(apply qe)
(pop)
(push)
    (assert 
                 (forall ((d Int) (c Int) (b Int)) 
                      (and (= c 0) (= d (* b c)) (= d 0))))


(apply qe)
(pop)

(push)
(assert (exists ((k!12 Int) (k!11 Int)) (and (= (ite (= k!11 0) 0 k!11) k!11) (not (= (ite (= k!12 (+ 1)) 1 0) 0)))))
(apply qe)
(pop)

(push)
    (assert 
                 (forall ((a Int) (b Int) (x Int) (y Int) (z Int))
                   (implies (and (= (+ a 2) b) (= x (+ 1 (- b a))) (= y (- b 2)) (= z 3)) false)))
(apply qe)
(pop)

(push)
    (assert 
                 (exists ((a Int) (b Int))
                   (and (> a 1) (> b 1) (= a b) (or (= a (* 2 b)) (= (* 2 b) (+ 1 (* 3 a)))))))
(apply qe)
(pop)

(push)
(assert (forall ((d Int)) (implies true     (exists ((x Int) (y Int)) (and true     true     (= d (+ (* 3 x) (* 5 y))))))))
(apply qe)
(pop)

(push)

(assert (forall ((d Int)) (implies (>= d 8) (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= d (+ (* 3 x) (* 5 y))))))))
(apply qe)
(pop)

(push)
    (assert (forall ((d Int)) (implies (>= d 0) (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= d (- (* 3 x) (* 5 y))))))))
(apply qe)
(pop)

(push)    
    (assert (exists ((x Int) (y Int) (z Int)) (= 1 (- (* 4 x) (* 6 y)))))
(apply qe)
(pop)

(push)
(assert   (exists ((l Int)) (forall ((x Int)) (implies (>= x l) 
                        (exists ((u Int) (v Int)) (and (>= u 0) (>= v 0) (= x (+ (* 3 u) (* 8 v)))))))))
(apply qe)
(pop)

(push)
(assert (exists ((l Int)) (forall ((x Int)) (implies (>= x l) 
                        (exists ((u Int) (v Int)) (and (>= u 0) (>= v 0) (= x (+ (* 3 u) (* 8 v)))))))))
(apply qe)
(pop)

(push)
    (assert (forall ((x Int)) (exists ((y Int)) (and (<= (* 2 y) x) (< x (* 2 (+ y 1)))))))
(apply qe)
(pop)

(push)


    (assert (exists ((x Int) (y Int)) (and (> y 0) (> y (* 2 x)) (< y (+ x 2)) (= 0 (mod y 2)))))
(apply qe)
(pop)

(push)

    (assert (exists ((x Int)) (and (< (* 3 x) 3) (< 1 (* 2 x)))))
(apply qe)
(pop)

(push)

    (assert (exists ((x Int)) (and (< (* 3 x) 4) (< 1 (* 2 x)))))
(apply qe)
(pop)

(push)

    (assert (exists ((x Int)) (and (< (+ (* 3 x) 1) 10) (> (- (* 7 x) 6) 7) (= 0 (mod x 3)))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int)) (and (< (- 1 (* 5 y)) x) (< (+ 1 y) (* 13 x)) (< (+ x 2) 0) (> y 0))))    
(apply qe)
(pop)

(push)
    
    (assert (exists ((x Int) (y Int)) (and (< (- 1 (* 5 y)) x) (< (+ 1 y) (* 13 x)) (< x (- 2)))))
(apply qe)
(pop)

(push)
    
    (assert (exists ((w Int) (z Int) (y Int) (x Int)) (and (< (- 1 (* 5 y)) (+ x (* 2 z))) (< (+ 1 y w (* (- 4) z)) (* 13 x)) (< x (- 2)) (> z 0))))
(apply qe)
(pop)

(push)

    
    
    (assert 
                 (forall ((w Int))
                   (exists ((z Int) (y Int) (x Int))
                     (and (< (- 1 (* 5 y)) (+ x (* 2 z))) 
                          (< (- (+ 1 y) (* 4 z)) (* 13 x)) 
                          (< x (- 2)) (> z 0) (< x 10))))     )
    
(apply qe)
(pop)

(push)
    
    (assert 
                 (forall ((d Int) (c Int) (b Int))
                      (and (= c 0) (= d (* b c)) (= d 4))))
(apply qe)
(pop)

(push)

    (assert
                 (exists ((d Int) (c Int) (b Int)) 
                      (and (= c 0) (= d (* b c)) (= d 0))))
(apply qe)
(pop)

(push)
    
    (assert (exists ((d Int) (c Int) (b Int)) 
                    (and (= c 0) (= d (* b c)) (= d 4))))

(apply qe)
(pop)

(push)

    (assert (forall ((x Int) (y Int)) (not (= (+ 1 (* 2 x)) (* 2 y)))))
(apply qe)
(pop)

(push)

    (assert (exists ((x Int) (y Int)) (= 1 (- (* 4 x) (* 6 y)))))
(apply qe)
(pop)

(push)
    (assert (forall ((d Int)) (implies (>= d 0) (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= d (+ (* 3 x) (* 5 y))))))))
(apply qe)
(pop)

(push)
    (assert (forall ((d Int)) (implies true     (exists ((x Int) (y Int)) (and true     true     (= d (+ (* 3 x) (* 5 y))))))))
(apply qe)
(pop)

(push)
    (assert (forall ((d Int)) (implies (>= d 8) (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= d (+ (* 3 x) (* 5 y))))))))
(apply qe)
(pop)

(push)
    (assert (forall ((d Int)) (implies (>= d 0) (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= d (- (* 3 x) (* 5 y))))))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int)) (and (> x 0) (>= y 0) (= 1 (- (* 3 x) (* 5 y))))))
    
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int) (z Int)) (= 1 (- (* 4 x) (* 6 y)))))
(apply qe)
(pop)

(push)
    (assert (forall ((x Int) (y Int)) (implies (<= x y) (< (+ 1 (* 2 x)) (* 2 y)))))
(apply qe)
(pop)

(push)    
    (assert (forall ((x Int) (y Int) (z Int)) (implies (= (+ 1 (* 2 x)) (* 2 y)) (> (+ x y z) 129))))
(apply qe)
(pop)

(push)    
    (assert (forall ((a Int)) (exists ((b Int)) (or (< a (+ (* 4 b) (* 3 a))) (and (not (< a b)) (> a (+ b 1)))))))
(apply qe)
(pop)

(push)
    (assert (exists ((y Int)) (forall ((x Int)) (and (> (+ x (* 5 y)) 1) (> (- (* 13 x) y) 1) (< (+ x 2) 0)))))
(apply qe)
(pop)

(push)
    (assert (forall ((x Int) (y Int)) (implies (and (>= x 0) (>= y 0)) (or (< (- (* 12 x) (* 8 y)) 0) (> (- (* 12 x) (* 8 y)) 2)))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int)) (= 1 (+ (* 5 x) (* 10 y)))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= 1 (- (* 5 x) (* 6 y))))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int) (z Int) (w Int)) (= 1 (+ (* 2 w) (* 3 x) (* 4 y) (* 5 z)))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= 1 (- (* 5 x) (* 3 y))))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= 1 (- (* 3 x) (* 5 y))))))
(apply qe)
(pop)

(push)
    (assert (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= 1 (- (* 6 x) (* 3 y))))))
(apply qe)
(pop)

(push)
    (assert (forall ((x Int) (y Int)) (or (= 0 (mod x 5)) (= 0 (mod y 6)) (not (= (* 6 x) (* 5 y))))))
(apply qe)
(pop)

(push)
    (assert (forall ((x Int) (y Int)) (or (not (= (* 6 x) (* 5 y))))))
(apply qe)
(pop)

(push)

   

    (assert (forall ((z Int)) (implies (> z 7) (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= (+ (* 3 x) (* 5 y)) z))))))
(apply qe)
(pop)

(push)
    (assert (forall ((z Int)) (implies (> z 2) (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= (+ (* 3 x) (* 5 y)) z))))))
(apply qe)
(pop)

(push)
    (assert 
                 (forall ((z Int)) (implies (<= z 7) 
                     (iff      (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= z (+ (* 3 x) (* 5 y))))) 
                          (not (exists ((x Int) (y Int)) (and (>= x 0) (>= y 0) (= (- 7 z) (+ (* 3 x) (* 5 y))))))))) )

(apply qe)
(pop)

(push)
    (assert
                 (forall ((x Int))
                   (iff (and (not (exists ((m Int)) (= x (* 2 m)))) (exists ((m Int)) (= x (+ (* 3 m) 1)))) 
                        (or  (exists ((m Int)) (= x (+ (* 12 m) 1))) (exists ((m Int)) (= x (+ (* 12 m) 7)))))))
 
(apply qe)
(pop)

(push)
    (assert 
                 (forall ((a Int) (b Int) (x Int) (y Int) (z Int)) 
                   (implies (and (= (+ a 2) b) (= x (+ 1 (- b a))) (= y (- b 2)) (= z 3)) false)))
(apply qe)
(pop)

(push)

    (assert
                 (exists ((a Int) (b Int) )
                   (and (not (= a 1)) (= a b) (or (= a (* 2 b)) (= (* 2 b) (+ 1 (* 3 a)))))))

(apply qe)
(pop)

(push)

    (assert 
                 (exists ((a Int) (b Int)) 
                   (and (> a 1) (> b 1) (= a b) (or (= a (* 2 b)) (= (* 2 b) (+ 1 (* 3 a)))))))
(apply qe)
(pop)

(push)
    (assert 
                 (exists ((a Int) (b Int))
                   (and (> a 1) (> b 1)  
                     (or (= a (* 2 b)) (= (* 2 b) (+ 1 (* 3 a)))) 
                     (or (= b (* 2 a)) (= (* 2 a) (+ 1 (* 3 b)))))))

(apply qe)
(pop)

(push)



    (assert (forall ((x Int) (y Int))
                   (iff (exists ((d Int)) (= (+ x y) (* 2 d))) 
                        (iff (exists ((d Int)) (= x (* 2 d))) (exists ((d Int)) (= y (* 2 d)))))))
(apply qe)
(pop)

(push)
(assert (forall ((n Int)) 
                  (implies (and (< 0 n) (< n 2400)) 
                      (or (and (<= n 2) (<= 2 (* 2 n))) 
                          (and (<= n 3) (<= 3 (* 2 n))) 
                          (and (<= n 5) (<= 5 (* 2 n))) 
                          (and (<= n 7) (<= 7 (* 2 n))) 
                          (and (<= n 13) (<= 13 (* 2 n))) 
                          (and (<= n 23) (<= 23 (* 2 n))) 
                          (and (<= n 43) (<= 43 (* 2 n))) 
                          (and (<= n 83) (<= 83 (* 2 n))) 
                          (and (<= n 163) (<= 163 (* 2 n))) 
                          (and (<= n 317) (<= 317 (* 2 n))) 
                          (and (<= n 631) (<= 631 (* 2 n))) 
                          (and (<= n 1259) (<= 1259 (* 2 n))) 
                          (and (<= n 2503) (<= 2503 (* 2 n)))))) )

(apply qe)
(pop)


