
# Copyright (c) 2015 Microsoft Corporation
#let c q = () in
#let b x q = x 1 in
#let a x y q = if q=0 then (x 0; y 0) else assert false in
#let rec f n x q = if n <= 0 then x q else a x (f (n-1) (b x)) q in
#let s n q = f n c q in
#  s n 0

from z3 import *


Expr = Datatype('Expr')
Expr.declare('F')
Expr.declare('A')
Expr.declare('B')
Expr.declare('C')
Expr.declare('Unit')
Expr.declare('I', ('i', IntSort()))
Expr.declare('App', ('fn',Expr),('arg',Expr))
Expr = Expr.create()
I    = Expr.I
App  = Expr.App
F    = Expr.F
A    = Expr.A
B    = Expr.B
C    = Expr.C
Unit = Expr.Unit
Eval = Function('Eval',Expr,Expr,Expr,BoolSort(),BoolSort())

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
ok  = Const('ok',BoolSort())
ok1 = Const('ok1',BoolSort())
ok2 = Const('ok2',BoolSort())

fp = Fixedpoint()
fp.register_relation(Eval)
fp.declare_var(x, y, z, q, r, r1, r2, n, xi, yi, ok, ok1, ok2)

fp.fact(Eval(C,q,Unit,True))
fp.rule(Eval(App(B,x),q,r,ok),Eval(x,I(1),r,ok))
fp.rule(Eval(App(App(A,x),y),I(n),Unit,And(ok1,ok2,n==0)),
	[Eval(x,I(0),r1,ok1), Eval(y,I(1),r2,ok2)])
	 
fp.rule(Eval(App(App(F,I(n)),x),q,r,ok), [n <= 0, Eval(x,q,r,ok)])
fp.rule(Eval(App(App(F,I(n)),x),q,r,ok),
	[n > 0, Eval(App(App(A,x),App(App(F,I(n-1)),App(B,x))),q,r,ok)])

fp.set(use_farkas=False)
print fp

# unsat
print fp.query(Eval(App(App(F,I(0)),C),q,r,False))
print fp.get_answer()


#sat
print fp.query(Eval(App(App(F,I(n)),C),q,r,False))
print fp.get_answer()


fp.set(use_farkas=True)

# unsat
print fp.query(Eval(App(App(F,I(0)),C),q,r,False))
print fp.get_answer()


#sat
print fp.query(Eval(App(App(F,I(n)),C),q,r,False))
print fp.get_answer()
