# 2. Prefixing parameter names with module names or not.
# At global scope we have to prefix the names. 
# At local scope they are not prefixed.
# This leads to confusion.
# Fix: Either (1) insist on global names everywhere.

from z3 import *
tac = Tactic('smt')
#tac1 = With(tac, 'smt.arith.nl_arith',True)
tac2 = With(tac, 'arith.nl',True)
tac2 = With(tac, 'smt.arith.nl',True)

print tac2