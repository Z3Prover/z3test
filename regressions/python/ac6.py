
# Copyright (c) 2015 Microsoft Corporation
"""
>>> from z3 import *
>>> x, y, z = Bools('x y z')
>>> And(x, And(y, z))
And(x, And(y, z))
>>> And(And(x, y), z)
And(And(x, y), z)
>>> Or(x, Or(y, z))
Or(x, Or(y, z))
>>> Or(Or(x, y), z)
Or(Or(x, y), z)
>>> And(Or(x, y), z)
And(Or(x, y), z)
>>> Or(And(x, y), z)
Or(And(x, y), z)
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)

