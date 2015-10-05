
; Copyright (c) 2015 Microsoft Corporation


(dbg-used-vars (forall ((x Int) (y (Array Int Int)) (z Bool))
                       (>= (select y x) 0)))

(dbg-used-vars (forall ((x1 Int) (x2 Real) (x3 (Array Int Int)) (x4 Bool) (x5 Int))
                       (>= (select x3 x5) 0)))

(declare-fun p (Int) Bool)

(dbg-used-vars (exists ((x1 Real) (x2 Int) (x3 Int))
                       (and (p (to_int x1))
                            (forall ((y1 Int) (y2 Int))
                                    (or (p y1)
                                        (p x2))))))

(dbg-used-vars (exists ((x1 Real) (x2 Int) (x3 Int))
                       (and (p (to_int x1))
                            (forall ((y1 Int) (y2 Int))
                                    (or (p y1)
                                        (exists ((z1 Int))
                                                (= (p z1) (p x2))))))))

(dbg-used-vars (+ 2 3))

(dbg-used-vars (forall ((x Int))
                       (p 10)))

(dbg-used-vars (forall ((x Int) (y (Array Int Int)) (z Bool))
                       (= (select y x) (ite z 1 0))))
