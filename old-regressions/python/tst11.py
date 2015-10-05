
# Copyright (c) 2015 Microsoft Corporation

from z3 import *

x = Real('x')
y = Real('y')
g = Goal()
g.add(x > 10, y == x + 1) 
g.add(y > 1)
t = Tactic('simplify')
r = t.apply(g)
print(r)
print(len(r))
for s in r:
    print(s)
print("old goal:")
print(g)
t = Then('simplify', 'solve-eqs')
r = t.apply(g)
print r
s = Solver()
for f in r[0]:
    s.add(f)
print(s)
print(s.check())
print(s.model())
print("applying model convert...")
print(r.convert_model(s.model()))
print("done")
