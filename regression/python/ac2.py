from z3 import *
set_option(auto_config=True)

x, y = Reals('x y')

print (x - y) - (x - y)
print (x + y) + (x + y)
print (x + y) * x
print (x*y) + y

