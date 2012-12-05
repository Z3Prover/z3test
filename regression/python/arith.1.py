from z3 import *
set_option(auto_config=True)

x = Real('x')
y = Int('y')
a, b, c = Reals('a b c')
s, r = Ints('s r')
print x + y + 1 + (a + s)
print ToReal(y) + c
