
# Copyright (c) 2015 Microsoft Corporation
# 2. Prefixing parameter names with module names or not.
# At global scope we have to prefix the names. 
# At local scope they are not prefixed.
# This leads to confusion.
# Fix: Either (1) insist on global names everywhere.

from z3 import *
import sys
tac = Tactic('smt')

tac = With(tac, 'smt.arith.nl', False)

s = tac.solver()
s.add(Int('x')*Int('y') > 0)
print "unknown: ", s.check()

tac = With(Tactic('smt'), 'smt.arith.nl', True)
s = tac.solver()
s.add(Int('x')*Int('y') > 0)
print "sat: ", s.check()

tac = With(Tactic('smt'), 'arith.nl', True)
s = tac.solver()
s.add(Int('x')*Int('y') > 0)
print "sat: ", s.check()

try:
   With(tac, 'smt2.arith.nl',True)
except Z3Exception as e:
   sys.stdout.write("%s" % e)
   print "exception expected"

