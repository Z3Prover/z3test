
# Copyright (c) 2015 Microsoft Corporation
"""
>>> from z3 import *
>>> x, y = Reals('x y')
>>> simplify(x == y + 2, ':arith-lhs', True)
x + -1*y == 2
>>> simplify(x == y + 2, arith_lhs=True)
x + -1*y == 2
>>> simplify(x == y + 2, eq2ineq=True)
And(x <= 2 + y, x >= 2 + y)
>>> simplify(x == y + 2, eq2ineq=True, arith_lhs=True)
And(x + -1*y <= 2, x + -1*y >= 2)
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
