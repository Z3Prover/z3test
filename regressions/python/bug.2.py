"""
>>> from z3 import *
>>> b = BitVec('b', 16)
>>> Extract(12, 2, b).sexpr()
'((_ extract 12 2) b)'
>>> Extract(12, 2, b)
Extract(12, 2, b)
>>> SignExt(10, b).sexpr()
'((_ sign_extend 10) b)'
>>> SignExt(10, b)
SignExt(10, b)
>>> ZeroExt(10, b).sexpr()
'((_ zero_extend 10) b)'
>>> ZeroExt(10, b)
ZeroExt(10, b)
>>> RepeatBitVec(3, b).sexpr()
'((_ repeat 3) b)'
>>> RepeatBitVec(3, b)
RepeatBitVec(3, b)
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)

