from z3 import *

v = BitVecVal(0xbadc0de, 32)
print v.sexpr()
print v
print v.as_long()
