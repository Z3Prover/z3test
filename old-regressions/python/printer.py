from z3 import *
set_option(auto_config=True)

x = Int('x')
y = Int('y')
set_option(html_mode=True)
print x**2 + y**2 >= 1
set_option(html_mode=False)
print x**2 + y**2 >= 1

