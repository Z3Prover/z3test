
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

p = Bool('p')
q = Bool('q')
r = Bool('r')
solve(Implies(p, q), r == Not(q), Or(Not(p), r))
      
