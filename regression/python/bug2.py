from z3 import *

b = BitVec('b', 16)
print Extract(12, 2, b).sexpr()
print Extract(12, 2, b)
print SignExt(10, b).sexpr()
print SignExt(10, b)
print ZeroExt(10, b).sexpr()
print ZeroExt(10, b)
print RepeatBitVec(3, b).sexpr()
print RepeatBitVec(3, b)
