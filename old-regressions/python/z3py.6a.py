from z3 import *
set_option(auto_config=True)

x = Real('x')
solve(x > 4, x < 0)
