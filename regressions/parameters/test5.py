
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
x = Int('x')
p3 = Bool('p3')
s = Solver()
s.set(unsat_core=True)
s.assert_and_track(x > 0,  'p1')
s.assert_and_track(x != 1, 'p2')
s.assert_and_track(x < 0,  p3)
print(s.check())
#        unsat
c = s.unsat_core()
print len(c)
#        2
Bool('p1') in c
#        True
Bool('p2') in c
#        False
p3 in c
#        True