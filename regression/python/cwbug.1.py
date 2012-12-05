from z3 import *
open_log("py.log")

s = Solver()
try:
    s.proof()
except Z3Exception:
    print "failed"

