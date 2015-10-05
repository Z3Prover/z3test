
# Copyright (c) 2015 Microsoft Corporation

from z3 import *

x = Real('x')
y = Real('y')
g = Goal()
g.add(x > 10, y == x + 1) 
g.add(y > 1)
print Probe('num-consts')(g)
print Probe('size')(g)
print Probe('num-exprs')(g)
