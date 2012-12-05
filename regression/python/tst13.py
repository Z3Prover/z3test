
from z3 import *

a1 = Real('x') + 1
a2 = Real('x') + 1
print a1.hash() == a2.hash()
a3 = Real('x') + 2
print a3.hash() == a1.hash()
