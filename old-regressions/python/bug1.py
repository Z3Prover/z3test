
from z3 import *

s = Solver()
try:
    s.pop()
except Z3Exception as ex:
    print "failed:", ex

print "done"
