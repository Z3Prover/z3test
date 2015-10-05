
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

x, y = Ints('x y')
s = Tactic('smt').solver()
s.add(x > y + 1)
print s.check()
print s.model()
