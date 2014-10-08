# 3. There is authoritative list on what the global parameters are
# - E.g., the context_params are not listed.

from z3 import *
set("verbose", 10000)
fml = Int('x') > Int('y')
s = Solver()
s.add(fml)
print s.check()