from z3 import *

List = Datatype('List')
List.declare('cons', ('car', IntSort()), ('cdr', List))
List.declare('nil')
List = List.create()
cons = List.cons
nil  = List.nil

s = Fixedpoint()

s.set(engine='datalog',default_relation='smt_relation')

p = Function('p', List, IntSort(), BoolSort())
q = Function('q', List, IntSort(), BoolSort())

def odd(x):
    return x % 2 == 1
def even(x):
    return x % 2 == 0

x = Const('x',List)
y = Int('y')
z = Const('z',List)
s.declare_var(x, y, z)
s.register_relation(p, q)
s.add_rule(p(x,y), [odd(y), p(z,y), x == cons(0,z)])
s.add_rule(q(x,y), [p(z,y), z == cons(0,cons(0,x))])
s.add_rule(p(x,y), q(cons(0,x),y))
s.add_rule(p(x,y), [even(y), x == cons(0,cons(0,cons(0,nil)))])
print s.query(q(x,y))
print simplify(s.get_answer())
    
