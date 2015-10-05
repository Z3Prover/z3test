
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
open_log("py.log")

print "without auto config..."
s = Solver()
print s.check()
print s.model()

print "with auto config..."
set_option(auto_config=True)
s = Solver()
print s.check()
print s.model()

