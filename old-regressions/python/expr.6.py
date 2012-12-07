from z3 import *
set_option(auto_config=True)

x, y = Ints('x y')
print (x + y).decl().kind() == Z3_OP_ADD
print (x + y).decl().kind() == Z3_OP_SUB
