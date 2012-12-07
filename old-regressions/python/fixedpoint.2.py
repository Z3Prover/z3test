from z3 import *

set_option(relevancy=0,verbose=1)


def flatten(l):
    return [s for t in l for s in t]

def loc(i):
    return Int("loc%d" % i)

class ParameterizedTransitionSystem():
    def __init__(self, initial, transitions, vars):
	self.fp = Fixedpoint()
	self.initial     = initial
	self.transitions = transitions
	self.vars = vars

    def declare_rels(self, n):
	I = IntSort()
	B = BoolSort()
	var_sorts   = [ v(0).sort() for v in self.vars ]
	state_sorts1 = [I] + var_sorts
	state_vals1 = lambda(i): [loc(i)] + [ v(i) for v in self.vars ]
	self.state_vals  = flatten([ state_vals1(i) for i in range(n)])
	state_sorts = flatten([ state_sorts1 for i in range(n)])
	self.state_sorts1 = state_sorts1
	self.state_sorts  = state_sorts
	self.var_sorts = var_sorts
	self.state  = Function('state', state_sorts + [ B ])
	self.step   = Function('step',  state_sorts + state_sorts + [ B ])
	self.step1  = Function('step1', state_sorts + state_sorts1 + [ B ])
	self.fp.register_relation(self.state)
	self.fp.register_relation(self.step)
	self.fp.register_relation(self.step1)

# Set of reachable states are transitive closure of step.

    def state0(self):
	return self.state([Var(i,self.state_sorts[i]) for i in range(len(self.state_sorts))])
	
    def state1(self):
	n = len(self.state_sorts)
	return self.state([Var(i+n, self.state_sorts[i]) for i in range(n)])

    def rho(self):
	n = len(self.state_sorts)
	args = [Var(i,self.state_sorts[i]) for i in range(n)] + [ Var(i+n,self.state_sorts[i]) for i in range(n)]
	return self.step(args)

    def declare_reachability(self):
	self.fp.rule(self.state1(), [self.state0(), self.rho()])

# Take step by one of the n processes
	
    def rhok(self, k):
	n = len(self.state_sorts)
	m = len(self.state_sorts1)
	args1 = [Var(i,self.state_sorts[i]) for i in range(n)]
	args2 = [Var(i,self.state_sorts[i]) for i in range(n)]
	for i in range(m):
	    args2[i+k*m] = Var(i+n,self.state_sorts1[i])
	args = args1 + args2
	return self.step(args)

    def rho1(self, k):
	n = len(self.state_sorts)
	m = len(self.state_sorts1)
	args = [Var(i,self.state_sorts[i]) for i in range(n)] + [Var(i+n,self.state_sorts1[i]) for i in range(m)]
	m = len(self.state_sorts1)
	for i in range(m):
	    args[i+k*m] = Var(i,self.state_sorts1[i])
	    args[i] = Var(i+k*m,self.state_sorts1[i])		
	return self.step1(args)
	
    def declare_step1(self, n):
	for k in range(n):
	    self.fp.rule(self.rhok(k), [self.rho1(k)])

    # Define transition relation

    def abstract(self, e):
	n = len(self.state_sorts)
	sub = [(self.state_vals[i], Var(i,self.state_sorts[i])) for i in range(n)]
	return substitute(e, sub)
	
    def declare_transition(self, tr, n):
	len_s  = len(self.state_sorts)
	len_s1 = len(self.state_sorts1)
	len_v  = len(self.var_sorts)
	tr = tr(n)
	effect = tr["effect"]
	vars = [Var(i,self.state_sorts[i]) for i in range(len_s)] + [tr["l1"]] + effect
	vars[0] = tr["l0"]
	rho1 = self.abstract(self.step1(vars))
	guard = self.abstract(tr["guard"])
	self.fp.rule(rho1, guard)
	
    def declare_transitions(self, n):
	for t in self.transitions:
	    self.declare_transition(t, n)

    def declare_initial(self, n):
	self.fp.rule(self.state0(),[self.abstract(self.initial(i)) for i in range(n)])
	
    def query(self, n, query):
	self.declare_rels(n)
	self.declare_initial(n)
	self.declare_reachability()
	self.declare_step1(n)
	self.declare_transitions(n)
	query = And(self.state0(), self.abstract(query))
	print self.fp
	print query
	print self.fp.query(query)
	print self.fp.get_answer()
#	print self.fp.statistics()


L0  = 0
L1  = 1
L2  = 2

def y(i):
    return Int("y%d" % i)


def max(x,y):
    return If(x > y, x, y)

def max1(n):
    max_val = y(1)
    for i in range(n-2):
	max_val = max(y(i+2),max_val)
    return max_val + 1

# L0: y1 := y2 + 1 goto L1
t1 = lambda(n) : { "l0" : L0,
		   "l1" : L1,
		   "guard" : BoolVal(True),
		   "effect" : [ max1(n) ] }

# L1: await y2 = 0 or y1 <= y2 goto L2
t2 = lambda(n) : { "l0" : L1,
		   "l1" : L2,
		   "guard" : And([ Or(y(0) <= y(i+1), y(i+1) == 0) for i in range(n-1) ]),
		   "effect" : [ y(0) ] }

# L2: y1 := 0 goto L0
t3 = lambda(n) : { "l0": L2,
		   "l1" : L0,
		   "guard" : BoolVal(True),
		   "effect" : [IntVal(0) ]}


ptr = ParameterizedTransitionSystem( (lambda(i):And([loc(i) == 0, y(i) == 0])), [t1, t2, t3], [y])

ptr.query( 2, And([loc(0) == 2, loc(1) == 2 ]))


print "done"
