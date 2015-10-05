
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

f = Function('f', IntSort(), IntSort(), IntSort())
x, y = Ints('x y')
print ForAll([x, y], f(x, y) == 0)
print Exists(x, f(x, x) >= 0)

a, b = Ints('a b')
solve(ForAll(x, f(x, x) == 0), f(a, b) == 1)
