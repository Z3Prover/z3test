"""
>>> from z3 import *
>>> x, y = Reals('x y')
>>> s = Solver()
>>> s.add(x + 10000000000000000000000 == y, y >= 20000000000000000, y <= 20000000000000000)
>>> s.check()
sat
>>> s.model()[y]
20000000000000000
>>> s.model()[x]
-9999980000000000000000
>>> Sqrt(2) + Sqrt(3)
2**(1/2) + 3**(1/2)
>>> simplify(Sqrt(2) + Sqrt(3))
3.1462643699?
>>> simplify(Sqrt(2) + Sqrt(3)).sexpr()
'(root-obj (+ (^ x 4) (* (- 10) (^ x 2)) 1) 4)'
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
