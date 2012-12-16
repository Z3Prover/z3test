"""
>>> from z3 import *
>>> a, b, c = Ints('a b c')
>>> d, e = Reals('d e')
>>> s = Solver()
>>> s.add(a > b + 2, a == 2*c + 10, c + b <= 1000, d >= e)
>>> s.check()
sat
>>> m = s.model()
>>> m[a].as_long() > m[b].as_long() + 2
True
>>> m.eval(a == 2*c + 10)
True
>>> m.eval(d < e)
False
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)

