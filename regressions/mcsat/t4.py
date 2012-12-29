"""
>>> from z3 import *
>>> x = Int('x')
>>> s = MCSatCore()
>>> s.add_tactic('solve-eqs')
>>> s.freeze(x)
>>> s.add(x == 1)
>>> s.push()
>>> s
[x == 1]
>>> s = MCSatCore()
>>> s.add_tactic('solve-eqs')
>>> s.add(x == 1)
>>> s.push()
>>> s
[]
>>> y = Int('y')
>>> s = MCSatCore()
>>> s.add_tactic('solve-eqs')
>>> s.freeze(x)
>>> s.add(x == y, x > 0)
>>> s
[x == y, x > 0]
>>> s.push()
>>> s
[Not(x <= 0)]
>>> s = MCSatCore()
>>> s.add_tactic('solve-eqs')
>>> s.freeze(y)
>>> s.add(x == y, x > 0)
>>> s
[x == y, x > 0]
>>> s.push()
>>> s
[Not(y <= 0)]
>>> s = MCSatCore()
>>> s.add_tactic('solve-eqs')
>>> s.freeze(y)
>>> s.freeze(x)
>>> s.add(x == y, x > 0)
>>> s
[x == y, x > 0]
>>> s.push()
>>> s
[x == y, x > 0]
"""

# TODO: must install basic plugins to be able to handle this examples

# if __name__ == "__main__":
#    import doctest
#    if doctest.testmod().failed:
#        exit(1)
