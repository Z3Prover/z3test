
# Copyright (c) 2015 Microsoft Corporation

# g x y = x
# twice f x y = f (f x) y
# neg x y = -x()
# assert (=> (n >= 0 => twice neg (g n) () >= 0))

from z3 import *


Expr = Datatype('Expr')
Expr.declare('G')
Expr.declare('Twice')
Expr.declare('Neg')
Expr.declare('Unit')
Expr.declare('I',   ('i', IntSort()))
Expr.declare('App', ('fn',Expr), ('arg',Expr))

Expr  = Expr.create()
I     = Expr.I
App   = Expr.App
G     = Expr.G
Twice = Expr.Twice
Neg   = Expr.Neg
Unit  = Expr.Unit
Eval  = Function('Eval',Expr,Expr,Expr,BoolSort())

x   = Const('x',Expr)
y   = Const('y',Expr)
z   = Const('z',Expr)
q   = Const('q',Expr)
r   = Const('r',Expr)
r1  = Const('r1',Expr)
r2  = Const('r2',Expr)
xi  = Const('xi',IntSort())
yi  = Const('yi',IntSort())
n   = Const('n',IntSort())
f   = Const('f',Expr)

fp = Fixedpoint()
fp.register_relation(Eval)
fp.declare_var(x, y, z, q, r, r1, r2, n, xi, yi, f)

fp.fact(Eval(App(G,x),y,x))
fp.rule(Eval(App(App(Twice,f),x),y,z),	Eval(App(f, App(f,x)),y,z))
fp.rule(Eval(App(Neg,x),y,I(-xi)),Eval(x,Unit,I(xi)))

fp.set(":use-model-generalizer", True)
print fp.query(And(n >= 0,
		   Eval(App(App(Twice,Neg),App(G,I(n))),Unit, I(xi)),
		   xi < 0))

print fp.get_answer()

print fp.query(And(n >= 0,
		   Eval(App(App(Twice,Neg),App(G,I(n))),Unit, I(xi)),
		   xi > 0))

print fp.get_answer()


