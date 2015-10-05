
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

x = Int('x')
y = Real('y')
print (x + 1).sort()
print (y + 1).sort()
print (x >= 2).sort()
