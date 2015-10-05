
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

x, y = Reals('x y')
print x == y
print x != y
f1 = x == y
f2 = x == y
f3 = x != y
print eq(f1, f2)
print eq(f2, f1)
print eq(f1, f3)

f = Function('f', IntSort(), RealSort(), IntSort())
a, b = Ints('a b')
print f(a, a) > b
print f.range()
print f.arity()
print f.domain(0)
print f.domain(1)
print f.kind() == Z3_OP_UNINTERPRETED
print (a + b).decl().kind() == Z3_OP_ADD
print (a + b).decl().kind() == Z3_OP_UNINTERPRETED


