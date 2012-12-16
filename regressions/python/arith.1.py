"""
>>> from z3 import *
>>> x = Real('x')
>>> y = Int('y')
>>> a, b, c = Reals('a b c')
>>> s, r = Ints('s r')
>>> x + y + 1 + (a + s)
x + ToReal(y) + 1 + a + ToReal(s)
>>> ToReal(y) + c
ToReal(y) + c
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
