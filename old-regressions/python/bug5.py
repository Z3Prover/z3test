
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

x, y, z = Reals('x y z')
print x*y - y**2 + z**2
print x*y + y**2 - z**2
print (x + y)*z
set_html_mode()
print x*y - y**2 + z
print x*y + y**2 - z**2
