
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_html_mode()
x, y = Reals('x y')
print (x + y)**3
print x**(y + 3)
