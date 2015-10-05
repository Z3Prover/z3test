
# Copyright (c) 2015 Microsoft Corporation
# You can set a parameter on a solver, 
# but it is not checked whether it is legal.
# E.g, there are no error messages on parameters 
# that are not recognized.
# Fix: all pieces are there. We have to put these together to generate error 
# messages.


from z3 import *
tac = Tactic('smt')
try:
  tac1 = With(tac, blah=True)
except Z3Exception as e:
  print e
  print "exception expected"

try:
  tac1 = With(tac, 'arith.nl',4)
except Z3Exception as e:
  print e
  print "exception expected"

#print tac1