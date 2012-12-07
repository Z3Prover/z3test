from z3 import *
set_option(auto_config=True)

bv_solver = Then('simplify', 
                 'solve-eqs', 
                 'bit-blast', 
                 'sat').solver()

x, y = BitVecs('x y', 16)
solve_using(bv_solver, x | y == 13, x > y)
