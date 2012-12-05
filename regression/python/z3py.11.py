from z3 import *
set_option(auto_config=True)

x = Real('x')
s = Solver()
s.add(2**x == 3)
print s.check()
