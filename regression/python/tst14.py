
from z3 import *

x, y, z = Reals('x y z')
f = Function('f', RealSort(), RealSort())
s = Solver()
s.add(x > 10, y == x + 3, y < 15, f(x) > 2, f(y) != f(x))
print s.check()
m = s.model()
print m.decls()
for d in m:
    print "%s -> %s" % (d.name(), m[d])
print m.eval(z + 1)
print m.eval(z + 1, model_completion=True)
print m.eval(z)

fi = m[f]
print fi.else_value()
print fi.num_entries()
print fi.entry(0)
print fi.entry(0).num_args()
print fi.entry(0).arg_value(0)
print fi.entry(0).value()
print fi.entry(0).as_list()

a = Array('a', RealSort(), RealSort())
s.add(a[x] > 10, a[y] > 20)
print s
print s.check()
print s.model()
print s.model()[a]

