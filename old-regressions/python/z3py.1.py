
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

x = Int('x')
y = Int('y')
solve(x > 2, y < 10, x + 2*y == 7)
