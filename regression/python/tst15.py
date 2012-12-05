from z3 import *


a = Array('a', IntSort(), IntSort())
f = Function('f', IntSort(), IntSort())
m = Map(f, a)
print m
print is_map(m)
print is_map(a)
print is_select(m)
print is_select(m[0])
print is_store(Update(m, 0, 1))
print Update(m, 0, 1)
print is_store(m)
print get_map_func(m)
print get_map_func(m)(10)
print m[10]

