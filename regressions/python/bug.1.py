
# Copyright (c) 2015 Microsoft Corporation

from z3 import *

ok = False
s = Solver()
try:
    s.pop()
    print "FAILED"
except Z3Exception as ex:
    ok = True

if not ok:
    exit(1)


