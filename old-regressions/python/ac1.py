from z3 import *
set_option(auto_config=True)

x, y = Reals('x y')

print 2 - (x - y)
print 2 + (x - y)
print 2 - (x + y)
print 2 + (x + (y + y))
print 2 - (x - (y - y))
print 2 + (x - (y + y))
print x * (x * x)
print x/(y/y)
print x + -x
print -(x + y)
print "BVs..."
x, y = BitVecs('x y', 16)

print 2 - (x - y)
print 2 + (x - y)
print 2 - (x + y)
print 2 + (x + (y + y))
print 2 - (x - (y - y))
print 2 + (x - (y + y))
print x * (x * x)
print x/(y/y)

