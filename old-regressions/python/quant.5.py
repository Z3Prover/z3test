from z3 import *
set_option(auto_config=True)

f = Function('f', IntSort(), IntSort())
g = Function('g', IntSort(), IntSort())
a, b, c = Ints('a b c')
x = Int('x')

s = Solver()
s.set(auto_config=False, mbqi=False)

s.add( ForAll(x, f(g(x)) == x, patterns = [g(x)]),
       g(a) == c,
       g(b) == c,
       a != b )

# Display solver state using internal format
print s.sexpr()
print s.check()
