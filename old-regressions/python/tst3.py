
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

ctx1 = Context(relevancy=0)
ctx2 = Context(':model', False, ':pp-decimal', True, relevancy=2, pp_decimal_precision=50)
x = Int('x', ctx1)
_x = x.translate(ctx2)
print(_x == (x + 1).translate(ctx2))
print(simplify(Sqrt(2, ctx2)))
# pp_params is a global variable :-(
print(simplify(Sqrt(2, ctx1)))
s = Solver(ctx=ctx1)
s.add(x == 2)
print(s)
print(s.check())
print(s.model())
s = Solver(ctx=ctx2)
s.add(_x == 2)
print(s.check())
try:
    print(s.model())
except Z3Exception as ex:
    print("failed: %s" % ex)
