from z3 import *
set_option(auto_config=True)

# This is a comment
x = Real('x') # comment: creating x
print x**2 + 2*x + 2  # comment: printing polynomial
