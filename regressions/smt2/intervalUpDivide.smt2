;; Copyright (c) 2017 Nathan Fulton
(assert (not (forall ((_yy Real) (_xx Real) (_Y Real) (_X Real) (_z Real) (_y Real) (_x Real)) (=> (and (and (and (<= _xx _x) (<= _x _X)) (and (<= _yy _y) (<= _y _Y))) (and (or (< _Y 0) (< 0 _yy)) (and (<= (/ _xx _yy) _z) (and (<= (/ _xx _Y) _z) (and (<= (/ _X _yy) _z) (<= (/ _X _Y) _z)))))) (<= (/ _x _y) _z)))))
(check-sat)
