
# Copyright (c) 2015 Microsoft Corporation
"""
>>> from z3 import *
>>> x, y = Reals('x y')
>>> t = simplify((x + y)**3, som=True)
>>> t
x*x*x + 3*x*x*y + 3*x*y*y + y*y*y
>>> simplify(t, mul_to_power=True)
x**3 + 3*x**2*y + 3*x*y**2 + y**3
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
