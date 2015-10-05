
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

x = Const('x', IntSort())
print eq(x, Int('x'))

a, b = Consts('a b', BoolSort())
print And(a, b)
