from z3rcf import *

r1, r2 = MkRoots([-2, 0, 1])
assert(r1**2 == 2)
assert(r1 == -r2)
assert(2/r1 == r1)
assert(r1 + r2 == 0)
if r1 > 0:
    a  = r1
    r1 = r2
    r2 = a
assert(r1.decimal(5) == "-1.41421?")
assert(r2.decimal(5) == "1.41421?")
assert((3*r2 - 1).decimal(5) == "3.24264?")
assert(str(3/r2) == "3/2*root(#^2 + -2, (0, +oo), {})")
assert(str(r2**3 + r2 + 1) == "3*root(#^2 + -2, (0, +oo), {}) + 1")
assert(str(r1**3 + r1 + 1) == "3*root(#^2 + -2, (-oo, 0), {}) + 1")

rs = MkRoots([r1, 0, 0, Fraction(1, 3)])
assert(len(rs) == 1)
r3 = rs[0]
assert(str(r3) == "root(#^3 + 3*root(#^2 + -2, (-oo, 0), {}), (0, +oo), {})")
assert(r3.decimal(6) == "1.618870?")

# Roots of x^5 + Pi*x - Pi
rs = MkRoots([-Pi(), Pi(), 0, 0, 0, 1])
assert(len(rs) == 1)
r4 = rs[0]
assert(str(r4) == "root(#^5 + pi*# + -1*pi, (0, +oo), {})")
assert(r4.decimal(5) == "0.85476?")
assert(r3 > r4)
assert((r3 + r4**6).decimal(5) == "2.00887?")
assert(r3 + r4**6 > 2)
assert(str(r3 + r4**6) == "-1*pi*root(#^5 + pi*# + -1*pi, (0, +oo), {})^2 + pi*root(#^5 + pi*# + -1*pi, (0, +oo), {}) + root(#^3 + 3*root(#^2 + -2, (-oo, 0), {}), (0, +oo), {})")

# Computing with infinitesimals
eps = MkInfinitesimal("eps")
assert(2*eps > eps)
assert(eps < Fraction(1, 1000000000000000000))
assert(eps**2 < eps)
assert(2 + 3*eps + -2*eps**2 > 2 + 3*eps -3*eps**2)
assert(2 + 3*eps + -2*eps**2 + eps**3 > 2 + 3*eps -2*eps**2)
assert(2 + 3*eps + -2*eps**2 + eps**3 < 2 + 3*eps -2*eps**2 + 2*eps**3)
r5 = MkRoots([-eps, 0, 0, 1])[0]
assert(r5 > 0)
assert(r5 > eps)
assert(str(r5**4) == "eps*root(#^3 + -1*eps, (0, +oo), {})")
r6 = MkRoots([-eps, 0, 0, eps + 1])[0]
assert(r6 > 0)
assert(r6 > eps)
assert(r6 < 1)
assert(r6.decimal() == "0.00000?")
assert((-r6).decimal() == "-0.00000?")
r7 = MkRoots([-1, 0, 0, eps])[0]
assert(r7 > 1000000000000000000)
assert(str(r7) == "root(eps*#^3 + -1, (0, +oo), {})")
assert(r7 < 1/eps)
assert(r7**2 < 1/eps)
assert(r7**3 == 1/eps)


