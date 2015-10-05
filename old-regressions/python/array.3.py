
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

A = Array('A', IntSort(), IntSort())
x, y = Ints('x y')
solve(A[x] == x, Store(A, x, y) == A)

