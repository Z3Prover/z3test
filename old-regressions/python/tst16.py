from z3 import *

U = DeclareSort('U')
f = Function('f', U, U)
a, b, c = Consts('a b c', U)
s = Solver()
s.add(f(f(a)) == b, f(b) != c, f(c) == c)
print s.check()
m = s.model()
for d in m:
    print "%s -> %s" % (d.name(), m[d])
print m.num_sorts()
print m.get_sort(0)
print m.sorts()
print m[U]
print "universe for U:"
for v in m[U]:
    print v
