# Copyright (c) 2015 Microsoft Corporation
"""
Testing floating-point operations
>>> from z3 import *
>>> nz = FPVal(-0.0, Float32())
>>> z = FPVal(0.0, Float32())
>>> x = FP('x', Float32())
>>> solve(fpNeg(x) != nz - x)
no solution
>>> solve(fpNeg(x) != z - x)
[x = +0.0]
>>> solve(nz == z)
no solution
>>> solve(fpEQ(nz, z))
[]
>>> solve(nz != z)
[]
>>> solve(fpNEQ(nz, z))
no solution
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
