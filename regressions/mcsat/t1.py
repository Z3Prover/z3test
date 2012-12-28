"""
>>> from z3 import *
>>> s = MCSatCore()
>>> s.check()
sat
>>> s.add(False)
>>> s.check()
unsat
>>> s = MCSatCore()
>>> s.check()
sat
>>> s.push()
>>> s.check()
sat
>>> s.add(False)
>>> s.check()
unsat
>>> s.pop()
>>> s.check()
sat
>>> s = MCSat()
>>> s.check()
sat
>>> s.add(False)
>>> s.check()
unsat
>>> s = MCSat()
>>> s.check()
sat
>>> s.push()
>>> s.check()
sat
>>> s.add(False)
>>> s.check()
unsat
>>> s.pop()
>>> s.check()
sat
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)


