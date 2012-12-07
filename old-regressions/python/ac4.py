from z3 import *
set_option(auto_config=True)

x, y, z = Reals('x y z')
set_html_mode()

print x - y - x - z
print x - y - (x - z)
print x - (y - x) - z
print x - y + x - z
print x - y + (x - z)
print x - (y + x) - z
print x**y**z
print x**(y**z)
print (x**y)**z

