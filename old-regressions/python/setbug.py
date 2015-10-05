
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

try:
    n = RealVal("1/0")
    print n
except Z3Exception as ex:
    print "failed:", ex

# set_option was throwing the previous exception because Z3_update_param_value was not resetting the error code.
set_option(PP_BOUNDED=True)

print "done"
