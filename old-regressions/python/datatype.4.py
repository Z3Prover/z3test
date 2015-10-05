
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

Color, (red, green, blue) = EnumSort('Color', ('red', 'green', 'blue'))

print green == blue
print simplify(green == blue)

c = Const('c', Color)
solve(c != green, c != blue)
