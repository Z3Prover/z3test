
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

C = Context(PROOF_MODE=2)

p = Bool('p', ctx=C)
s = Solver(ctx=C)
s.add(p)
s.add(Not(p))
print s.check()
print s.proof()
