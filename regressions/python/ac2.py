
# Copyright (c) 2015 Microsoft Corporation
"""
>>> from z3 import *
>>> x, y = Reals('x y')
>>> (x - y) - (x - y)
x - y - (x - y)
>>> (x + y) + (x + y)
x + y + x + y
>>> (x + y) * x
(x + y)*x
>>> (x*y) + y
x*y + y
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
