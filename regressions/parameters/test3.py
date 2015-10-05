
# Copyright (c) 2015 Microsoft Corporation
# 3. There is authoritative list on what the global parameters are
# - E.g., the context_params are not listed.

from z3 import *
set_param(verbose=1000)
fml = Int('x') > Int('y')
s = Solver()
s.add(fml)
print s.check()