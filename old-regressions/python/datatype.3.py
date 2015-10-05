
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

Color = Datatype('Color')
Color.declare('red')
Color.declare('green')
Color.declare('blue')
Color = Color.create()

print is_expr(Color.green)
print Color.green == Color.blue
print simplify(Color.green == Color.blue)

# Let c be a constant of sort Color
c = Const('c', Color)
# Then, c must be red, green or blue
prove(Or(c == Color.green, 
         c == Color.blue,
         c == Color.red))
