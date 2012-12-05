from z3 import *

try:
    n = RealVal("1/0")
    print n
except Z3Exception as ex:
    print "failed:", ex
print "done"
