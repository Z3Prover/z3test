
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

f = Function('f', IntSort(), RealSort(), IntSort())

try:
    print(f.domain(3))
except Z3Exception:
    print("Failed")

x = Int('x')

print(f(1, 1))
print(f(1, 1).sort())
print(f(x, 1).num_args())
print(f(x+1, 1).children())
print(f(x+1, 1).arg(0))
print(f(x+1, 1).arg(0).eq(x+1))
print(f(x+1, x).decl()(2, x+1))
print(is_expr(1))
print(is_expr(IntVal(1)))
print(is_expr(x + 1))
print(is_app(1))
print(is_app(IntVal(1)))
print(is_app(x + 1))
print(is_expr(ForAll(x, x > 0)))
print(is_app(ForAll(x, x > 0)))
print(is_const(IntVal(1)))
print(is_const(x))
print(is_const(x + 1))
print(is_const(ForAll(x, x > 0)))
print(ForAll(x, x > 0).body().arg(0))
print(is_expr(ForAll(x, x > 0).body().arg(0)))
print(is_app(ForAll(x, x > 0).body().arg(0)))
print(is_const(ForAll(x, x > 0).body().arg(0)))
print(is_var(ForAll(x, x > 0).body().arg(0)))
print(is_var(x))
print(If(True, x, x+1))
ctx = Context()
print(If(True, x.translate(ctx), (x+1).translate(ctx)) == If(True, 1, 1, ctx))
print(Distinct(x, x+1, x+2))
try:
    print(Distinct(1, 2, 3))
except Z3Exception:
    print("failed")
print(And(Distinct(x.translate(ctx), 1),
          x.translate(ctx) > 0))


