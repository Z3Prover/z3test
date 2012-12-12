# -------------------------------------------------------------#
#                   NonlinearSystem.m
# 
# This python program is using z3 for solving a nonlinear system.
#
# The nonlinear system to solve:
# a1 + a2 = 2
# a1*t1 + a2*t2 = 2/3
# a1*t1*t1 + a2*t2*t2 = 2/5
# a1*t1*t1*t1 + a2*t2*t2*t2 = 2/7
#
# We already know there are two sets of analytical roots:
# t2 = (3/7) +- (2/35)*sqrt(30)
# t1 = (3 - 5*t2)/(5 - 15*t2)
# a1 = (2/3)*(1 - 3*t2)/(t1 - t2)
# a2 = 2 - a1
#
# The decimal approx value of the roots are:
# a1 = 0.695709690274908
# a2 = 1.304290309725092
# t1 = 0.741555747145809
# t2 = 0.115587109997048
# and 
# a1 = 1.304290309725092
# a2 = 0.695709690274908
# t1 = 0.115587109997048
# t2 = 0.741555747145809
#                                   by Yan Peng
#                                   Latest changed: 2012/11/25
################################################################
from z3 import *

a1, a2, t1, t2 = Reals('a1 a2 t1 t2');    # variables
s = Solver()
s.add( a1 + a2 == RealVal(2),
       a1*t1 + a2*t2 == Q(2,3),
       a1*t1*t1 + a2*t2*t2 == Q(2,5),
       a1*t1*t1*t1 + a2*t2*t2*t2 == Q(2,7) )

if s.check() != sat:
        exit(1)
