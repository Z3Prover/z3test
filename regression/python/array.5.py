from z3 import *
set_option(auto_config=True)

AllOne = K(IntSort(), 1)
a, i = Ints('a i')
solve(a == AllOne[i])
# The following constraints do not have a solution
solve(a == AllOne[i], a != 1)
