from z3 import *

try: 
  ctx = Context(':smt.auto_config',True)
except Z3Exception as e:
  print e
  print "exception expected"