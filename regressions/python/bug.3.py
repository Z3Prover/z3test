"""
>>> from z3 import *
>>> v = BitVecVal(0xbadc0de, 32)
>>> v.sexpr()
'#x0badc0de'
>>> v
195936478
>>> v.as_long()
195936478L
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)

