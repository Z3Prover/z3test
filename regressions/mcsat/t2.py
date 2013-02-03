"""
>>> from z3 import *
>>> x = Int('x')
>>> s = MCSatCore()
>>> s.check()
sat
>>> s.add(x != x)
>>> s.check() # doctest: +ELLIPSIS
Traceback (most recent call last):
Z3Exception: ...
>>> s = MCSatCore()
>>> s.add_tactic('simplify')
>>> s.check()
sat
>>> s.add(x != x)
>>> s.check()
unsat
>>> s = MCSatCore()
>>> p, q, r = Bools('p q r')
>>> s.add_tactic('simplify')
>>> s.add_tactic('solve-eqs')
>>> s.set(unsat_core=True)
>>> s.add_and_track(x == 1, p)
>>> s.add_and_track(x < 0, q)
>>> s.add_and_track(x > -10, r)
>>> s.check()
unsat
>>> core = s.unsat_core()
>>> len(core)
2
>>> eq_core(core, [p, q])
True
"""

def eq_core(core, core2):
    for a in core:
        if not a in core2:
            return False
    for a in core2:
        if not a in core:
            return False
    return True


if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
