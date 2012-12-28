"""
>>> from z3 import *
>>> x = Int('x')
>>> s = MCSatCore()
>>> s.add_tactic('simplify')
>>> s.add_tactic('solve-eqs')
>>> s.check()
sat
>>> s.add(x == 1)
>>> s.add(x > 0)
>>> s.check()
sat
>>> s.model()
[x = 1]
>>> s.add(x > -1)
>>> s.check()
sat
>>> s.push()
>>> s.add(x < 1)
>>> s.check()
unsat
>>> s.pop()
>>> s.check()
sat
>>> s.model()
[x = 1]
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
