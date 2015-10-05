
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

x = Int('x')
print (x + 1).hash() == (1 + x).hash()
print x.sort().hash() == IntSort().hash()
