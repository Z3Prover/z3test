
# Copyright (c) 2015 Microsoft Corporation
"""
>>> from z3 import *
>>> x = Int('x')
>>> p = Bool('p')
>>> s = MCSatCore()
>>> s.add_tactic('solve-eqs')
>>> s.add(p)
>>> s.add(Implies(p, x == 1))
>>> s.push()
>>> s
[]
>>> s.check(p)
Traceback (most recent call last):
...
Z3Exception: "Assumption was eliminated, we must 'freeze' variables that are used as assumptions"
>>> s.check(x > 0)
Traceback (most recent call last):
...
Z3Exception: 'Assumptions must be Boolean variables or the negation of Boolean variables'
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
