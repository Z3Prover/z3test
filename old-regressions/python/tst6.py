
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

print(simplify(Sqrt(2)).sexpr())
set_option(":pp-decimal-precision", 50, pp_decimal=True)
print(simplify(Sqrt(2)).sexpr())
set_option(precision=20)
print(simplify(Sqrt(2)))
