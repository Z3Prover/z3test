;; Copyright (c) 2017 Nathan Fulton
(assert (not (forall ((_yy Real) (_xx Real) (_Y Real) (_X Real) (_z Real) (_y Real) (_x Real)) (=> (and (and (and (<= _xx _x) (<= _x _X)) (and (<= _yy _y) (<= _y _Y))) (and (or (< _Y 0) (< 0 _yy)) (and (<= _z (/ _xx _yy)) (and (<= _z (/ _xx _Y)) (and (<= _z (/ _X _yy)) (<= _z (/ _X _Y))))))) (<= _z (/ _x _y))))))
(check-sat)
