
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

fp = Fixedpoint()
fp.set(engine='datalog')

s = BitVecSort(3)
edge = Function('edge', s, s, BoolSort())
path = Function('path', s, s, BoolSort())
path1 = Function('path1', s, s, BoolSort())
a = Const('a',s)
b = Const('b',s)
c = Const('c',s)

fp.register_relation(path, path1, edge)
fp.declare_var(a,b,c)
fp.rule(path(a,b), edge(a,b))
fp.rule(path(a,c), [edge(a,b), path(b,c)])
fp.rule(path1(a,b), [path(a,b), Not(edge(a,b))])

v1 = BitVecVal(1,s)
v2 = BitVecVal(2,s)
v3 = BitVecVal(3,s)
v4 = BitVecVal(4,s)
v5 = BitVecVal(5,s)
v6 = BitVecVal(6,s)

fp.fact(edge(v1,v2))
fp.fact(edge(v1,v3))
fp.fact(edge(v2,v4))

# print "current set of rules", fp


print fp.query(path1(v1,v4)), "yes we can reach v4 from v1"

print fp.query(path1(v3,v4)), "no we cannot reach v4 from v3"

fp.fact(edge(v3,v5))
print fp.query(path1(v3,v4)), "no we cannot reach v4 from v3"

fp.fact(edge(v5,v1))

print fp.query(path1(v3,v4)), "no we can reach it"

fp.fact(edge(v3,v4))

print fp.query(path1(v3,v4)), "no we cannot reach v3-v4"


fp = Fixedpoint()

s = BitVecSort(3)
edge = Function('edge', s, s, BoolSort())
path = Function('path', s, s, BoolSort())
path1 = Function('path1', s, s, BoolSort())
a = Const('a',s)
b = Const('b',s)
c = Const('c',s)

fp.register_relation(path, path1, edge)
fp.declare_var(a,b,c)
fp.rule(path(a,b), edge(a,b))
fp.rule(path(a,c), [edge(a,b), path(b,c)])
fp.rule(path1(a,b), [path(a,b), Not(edge(a,b))])

v1 = BitVecVal(1,s)
v2 = BitVecVal(2,s)
v3 = BitVecVal(3,s)
v4 = BitVecVal(4,s)
v5 = BitVecVal(5,s)
v6 = BitVecVal(6,s)

fp.fact(edge(v1,v2))
fp.fact(edge(v1,v3))
fp.fact(edge(v2,v4))

# print "current set of rules", fp

fp.fact(edge(v3,v5))
fp.fact(edge(v5,v1))
fp.fact(edge(v3,v4))

print fp.query(path1(v3,v4)), "now we cannot reach v4. We did not pose queries this time"
