#include <vector>

#include "z3++.h"

int main()
{
    z3::context ctx;

    z3::expr x = ctx.int_const("x");
    z3::expr one = ctx.int_val(1);

    z3::expr t_1 = z3::max(-one, x);
    z3::expr t_2 = z3::min(one, x);
    z3::expr t_3 = z3::min(x, t_2);
    z3::expr t_4 = t_1 * t_3;
    z3::expr t_5 = x - t_4;
    z3::expr t_6 = t_4 * t_5;
    z3::expr t_7 = z3::ite(t_6 != 0, z3::rem(one, t_6), one);
    z3::expr r_1 = t_5 + t_7;

    assert(ctx.check_error() == Z3_OK);

    z3::solver solver(ctx);
    solver.push();
    solver.add(r_1 == 0);
    z3::check_result result_1 = solver.check();
    solver.pop();
    solver.push();
    solver.add(r_1 == 0);
    z3::check_result result_2 = solver.check();
    solver.pop();
    assert(ctx.check_error() == Z3_OK);
}
