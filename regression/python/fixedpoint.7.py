from z3 import *

I = IntSort()
B = BoolSort()
sum = Function('sum', I, I, B)
n, m = Ints('n m')

fp = Fixedpoint()
fp.declare_var(n,m)
fp.register_relation(sum)
fp.rule(sum(n,0), n <= 0)
fp.rule(sum(n,m+n), [n > 0, sum(n-1,m)])

print fp.query(And(sum(n,m),m < n))
print fp.get_answer()
