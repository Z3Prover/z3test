
(set-option :pp.max-depth 100)

(dbg-instantiate (forall ((x Int) (y Real))
                         (= (+ (to_real x) y) 10.0))
                 (3 5.0))

(dbg-instantiate (forall ((x Int) (y Real))
                         (= (+ (to_real x) y) 10.0))
                 (5.0 3))

(declare-fun p (Int) Bool)

(dbg-instantiate (forall ((x1 Real) (x2 Int) (x3 Int))
                         (and (p (to_int x1))
                              (forall ((y1 Int) (y2 Int))
                                      (or (p y1)
                                          (p x2)))))
                 (1.0 2 3))

(dbg-instantiate (forall ((x Int) (y (Array Int Int)) (z Bool))
                         (= (select y x) (ite z 1 0)))
                 (100 ((as const (Array Int Int)) 0) true))

(dbg-instantiate (forall ((x Int)) (p 10))
                 (10000))

(dbg-instantiate (forall ((x1 Real) (x2 Int) (x3 Int))
                         (and (p (to_int x1))
                              (forall ((y1 Int) (y2 Int))
                                      (or (p y1)
                                          (exists ((z1 Int))
                                                  (= (p z1) (p x2)))))))
                 (10.0 20 30))


