from z3 import *
f = Function('f', IntSort(), IntSort())
g = Function('g', IntSort(), IntSort())
a = Array('a', IntSort(), IntSort())
x = Int('x')
c = Int('c')
s = MCSatCore()
s.add_tactic('expand_macros')
s.add(a == AsArray(f))
try:
    s.push()
except:
    pass
s.add(ForAll([x], f(x) == x))
s.add(ForAll([x], g(x) == x))
s.add(g(c) > 0)
try:
    s.push()
except:
    pass
assert(repr(s) == "[a == AsArray(f), ForAll(x, f(x) == x), Not(c <= 0)]")
set_option(max_width=1000)
s.add(g(c + 1) > 0)
try:
    s.push()
except:
    pass
assert(repr(s) == "[a == AsArray(f), ForAll(x, f(x) == x), Not(c <= 0), c + 1 > 0]")
