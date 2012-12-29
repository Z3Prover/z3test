"""
>>> from z3 import *
>>> x = Int('x')
>>> p = Bool('p')
>>> s = MCSatCore()
>>> s.add_tactic('solve-eqs')
>>> s.add_and_track(True, p)
>>> s
[]
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
