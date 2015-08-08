"""
>>> from z3 import *
>>> s = Solver()
>>> s.check()
sat
>>> s.model()
[]
>>> s.push()
>>> s.assertions()
[]
>>> s.check()
sat
>>> s.add(False)
>>> s.check()
unsat
>>> s.pop()
>>> s.check()
sat
>>> s.sexpr()
''
>>> s.add(False)
>>> s.check()
unsat
>>> s.reset()
>>> s.check()
sat
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)

