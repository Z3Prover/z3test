from z3 import *

# f x y = assert (not (x() > 0 && y() < 0))
# h x y = x
# g n = f (h n) (h n)
# assert g m is safe.


Expr = Datatype('Expr')
Expr.declare('F')
Expr.declare('G')
Expr.declare('H')
Expr.declare('Unit')
Expr.declare('I', ('i', IntSort()))
Expr.declare('App', ('fn',Expr),('arg',Expr))
Expr = Expr.create()
I    = Expr.I
App  = Expr.App
F    = Expr.F
G    = Expr.G
H    = Expr.H
Unit = Expr.Unit
Eval = Function('Eval',Expr,Expr,BoolSort(),BoolSort())

x   = Const('x',Expr)
y   = Const('y',Expr)
z   = Const('z',Expr)
xi  = Const('xi',IntSort())
yi  = Const('yi',IntSort())
ok1 = Const('ok1',BoolSort())
ok2 = Const('ok2',BoolSort())

fp = Fixedpoint()
fp.register_relation(Eval)
fp.declare_var(x, y, z, xi, yi, ok1, ok2)

fp.rule(Eval(App(App(F,x),y),Unit,And(ok1,ok2,Not(And(xi > 0,yi < 0)))),
	[Eval(x,I(xi),ok1),Eval(y,I(yi),ok2)])


fp.rule(Eval(App(App(H,x),y),x,True))
fp.rule(Eval(App(G,x),z,ok1),
	Eval(App(App(F,App(H,x)),App(H,x)),z,ok1))


print fp.query(Eval(App(G,I(xi)),I(yi),False))
print fp.get_answer()

print fp.query(Eval(App(G,x),y,False))
print fp.get_answer()







