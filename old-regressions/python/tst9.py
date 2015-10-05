
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

x, y = Reals('x y')
s = Then('simplify', 'nlsat').solver()
s.add(x**2 == 2, y**3 == x + 1)
print(s.check())
set_option(pp_decimal=True)
print(s.model())
print(s.statistics())
print(s.statistics().keys())
print("NLSAT stages: %s" % s.statistics().get_key_value("nlsat stages"))
print("NLSAT stages: %s" % s.statistics().nlsat_stages)
print("done")
