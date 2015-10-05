
# Copyright (c) 2015 Microsoft Corporation
"""
>>> from z3 import *
>>> x, y, z = Reals('x y z')
>>> x - y - x - z
x - y - x - z
>>> x - y - (x - z)
x - y - (x - z)
>>> x - (y - x) - z
x - (y - x) - z
>>> x - y + x - z
x - y + x - z
>>> x - y + (x - z)
x - y + x - z
>>> x - (y + x) - z
x - (y + x) - z
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)


