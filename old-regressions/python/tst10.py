
from z3 import *

x, y, z = Reals('x y z')
a, b, c = Ints('a b c')

set_option(pp_flat_assoc=False)
print x + y + a
print x + 1
print 2 + y
print x * y
print 2 + 3
print 2 * x
print 2 + 3 + x
print a + b + 1
print x / y
print x / 2
print 2 / y
print a / 2
print a + b / 2
print 3 / a
print a % b
print a % 2
print 3 % a
print a - 2
print -a
print -x
print a - b
print is_add(a)
print is_add(a + b)
print is_add(a - b)
print is_add(10)
print is_mul(a * b)
print is_mul(x * b)
print is_mul(a + b)
print is_div(a / 2)
print is_div(3 / x)
print is_div(x / y)
print is_idiv(a / 2)
print is_add(2 + 3)
print is_arith(a)
print is_arith(2)
print is_arith(a + b)
print is_arith(Bool('p'))
print is_int_value(IntVal(2))
print is_rational_value(IntVal(2))
print RatVal(2, 3)
print RatVal(2, 3).is_real()
print is_arith(RatVal(2, 3))
print is_const(RatVal(2, 3))
print is_rational_value(simplify(RatVal(2, 3)))
print is_algebraic_value(simplify(Sqrt(2)))
print is_algebraic_value(Sqrt(2))
print Sqrt(2)
print Cbrt(2)
