
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

U = DeclareSort('U')
print(U)
a = Const('a', U)
a, b, c = Consts('a b c', U)
x, y = Consts('x y', IntSort())
print(And(a == b, a == c))
print(U == IntSort())
U2 = DeclareSort('U')
print(U == U2)
U2 = DeclareSort('U2')
print(U == U2)
print(Distinct(a, b, c))
f = Function('f', U, U, U)
print(f(a, b) == b)
