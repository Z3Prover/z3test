from z3 import *
set_option(auto_config=True)

t = Then('simplify', 
         'normalize-bounds', 
         'solve-eqs')

x, y, z = Ints('x y z')
g = Goal()
g.add(x > 10, y == x + 3, z > y)

r = t(g)
# r contains only one subgoal
print r

s = Solver()
s.add(r[0])
print s.check()
# Model for the subgoal
m = s.model()
print m
print r.convert_model(m)
print m
