from z3 import *
set_option(auto_config=True)

x, y, z = Bools('x y z')
set_html_mode()

print And(x, And(y, z))
print And(And(x, y), z)
print Or(x, Or(y, z))
print Or(Or(x, y), z)
print And(Or(x, y), z)
print Or(And(x, y), z)
