from z3 import *

x = Int("x")
try:
    solve(x == "3/2")
except Z3Exception as ex:
    print "failed:", ex
