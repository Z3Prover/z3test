
(set-option :pp.max-depth 100)

(dbg-instantiate-nested (forall ((z1 Int) (z2 Real) (z3 Real))
                                (forall ((x Int) (y Real))
                                        (= (+ (to_real x) y) (+ z2 (to_real z1)))))
                        (3 5.0))

(declare-fun p (Int) Bool)

(dbg-instantiate-nested (forall ((z1 Int) (z2 Real))
                                (forall ((x1 Real) (x2 Int) (x3 Int))
                                        (and (p (to_int x1))
                                             (forall ((y1 Int) (y2 Int))
                                                     (or (p y1)
                                                         (p x2)
                                                         (p z1))))))
                        (1.0 2 3))

(dbg-instantiate-nested (forall ((z1 Int) (z2 Int))
                                (forall ((x1 Real) (x2 Int) (x3 Int))
                                        (and (p (to_int x1))
                                             (p z2)
                                             (forall ((y1 Int) (y2 Int))
                                                     (or (p y1)
                                                         (p z1)
                                                         (p z2)
                                                         (exists ((z1 Int))
                                                                 (= (p z1) (p x2))))))))
                        (10.0 20 30))


