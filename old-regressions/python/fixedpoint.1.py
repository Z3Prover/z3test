
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

fp = Fixedpoint()

set_option(relevancy=0,verbose=1)

def max(x,y):
    return If(x > y, x, y)

n   = 2
B   = BoolSort()
I   = IntSort()
Loc = I
L0  = 0
L1  = 1
L2  = 2
    
state = Function('state', [Loc for i in range(n)] + [I for i in range(n)] + [B])
step  = Function('step', [Loc for i in range(2*n)] + [I for i in range(2*n)] + [B])
step1 = Function('step1', [Loc,Loc] + [I for i in range(n+1)] + [ B ])

fp.register_relation(state)
fp.register_relation(step)
fp.register_relation(step1)


loc_offset = 0
var_offset = n

def loc0(i):
    return Var(i+loc_offset,I)

def loc1(i):
    return Var(i+2*n+loc_offset,I)

def y0(i):
    return Var(i+var_offset,I)

def y1(i):
    return Var(i+2*n+var_offset,I)

def mk_state0(n):
    return state([(loc0(i)) for i in range(n)] + [(y0(i)) for i in range(n)])

def mk_state1(n):
    return state([(loc1(i)) for i in range(n)] + [(y1(i)) for i in range(n)])


# (rule (=> (and (state l m y1 y2) (step l m y1 y2 l_ m_ y1_ y2_)) (state l_ m_ y1_ y2_)))

def mk_ts(n):
    pre  = mk_state0(n)
    post = mk_state1(n)
    args = []
    for i in range(n):
	args += [loc0(i),loc1(i)]
    for i in range(n):
	args += [y0(i),y1(i)]
    rho  = step(args)
    fp.rule(post, [pre, rho])

def mk_rs_k(n,k):
    args1 = [loc0(k),loc1(k),y0(k)]    
    for i in range(n):
        if i != k:
           args1 += [y0(i)]
    args1 += [y1(k)]
    args = []
    for i in range(n):
        if i == k:
           args += [loc0(i),loc1(i)]
        else:
           args += [loc0(i),loc0(i)]	    
    for i in range(n):
        if i == k:
	    args += [y0(i), y1(i)]
        else:
	    args += [y0(i), y0(i)]
    fp.rule(step(args), [step1(args1)])

def mk_rs(n):
    for i in range(n):
        mk_rs_k(n,i)

# L0: y1 := y2 + 1 goto L1
def t1():
    max_val = y0(1)
    for i in range(n-2):
	max_val = max(y0(i+2),max_val)
    return (L0, L1, BoolVal(True), 1 + max_val)

# L1: await y2 = 0 or y1 <= y2 goto L2
def t2():
    guard = And([ Or(y0(0) <= y0(i+1), y0(i+1) == 0) for i in range(n-1) ])
    return (L1, L2, guard, y0(0))

    
# L2: y1 := 0 goto L0
def t3():
    return (L2, L0, BoolVal(True), IntVal(0))

def eval(tr, n):
    l0, l1, guard, val = tr
    args = [l0, l1]
    for i in range(n):
	args += [y0(i)]
    args += [val]
    fp.rule(step1(args), guard)

    
def mk_steps(n):
    for t in [t1,t2,t3]:
	eval(t(), n)

# (query (state L2 L2 y1 y2)) 
def mk_query(n):
    return fp.query(state([L2, L2] + [ loc0(i+2) for i in range(n-2) ] + [ y0(i) for i in range(n) ]))


fp.fact(state([L0 for i in range(n)] + [0 for i in range(n)]))
mk_steps(n)
mk_rs(n)
mk_ts(n)

print fp
print mk_query(n)
print fp.get_answer()
#print fp.statistics()
print "done"
