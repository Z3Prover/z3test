from z3 import *

p = Bool('p')
print Not(p)
print Not(p)
x = Int('x')
y = Int('y')
# True and False are converted into 1 and 0
print x + True 
print x + 1
print 1 + x
print x + y
print 2 * x
print x * 2
print x * y
print x / y
print x % y
print x == y
print Distinct(x, y, x)
print Not(x == y)
print x == y
print x + 1
print x + 1
p, q = Bools('p q')
print Not(p)
print Not(p)
print And(p, q)
print And(p, q)
print x == y

