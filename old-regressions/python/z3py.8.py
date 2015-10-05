
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

p = Bool('p')
q = Bool('q')
print And(p, q, True)
print simplify(And(p, q, True))
print simplify(And(p, False))
