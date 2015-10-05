
# Copyright (c) 2015 Microsoft Corporation
# Euler's four square identity
from z3 import *
set_option(auto_config=True)

a1, a2, a3, a4 = Reals('a1 a2 a3 a4')
b1, b2, b3, b4 = Reals('b1 b2 b3 b4')

LHS = (a1**2 + a2**2 + a3**2 + a4**2)*(b1**2 + b2**2 + b3**2 + b4**2)
print "LHS: ", LHS
RHS = (a1*b1 - a2*b2 - a3*b3 - a4*b4)**2 + (a1*b2 + a2*b1 + a3*b4 - a4*b3)**2 + (a1*b3 - a2*b4 + a3*b1 + a4*b2)**2 + (a1*b4 + a2*b3 - a3*b2 + a4*b1)**2
print "RHS: ", RHS
print "Is LHS==RHS?"
print simplify(LHS == RHS, som=True, arith_lhs=True, expand_power=True)
prove(LHS==RHS, show=True)
