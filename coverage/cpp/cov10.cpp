#include <vector>
#include "z3++.h"

int main()
{
    z3::context ctx;

    std::vector<z3::expr> vars;
    std::string new_var_name = "x" + std::to_string(0);
    z3::expr new_expr = ctx.int_const(new_var_name.c_str());
    vars.push_back(new_expr);

    z3::expr six = ctx.int_val(6);
    z3::expr x = vars.at(0);

    z3::expr in_0 = z3::abs(x + x);

    z3::expr t_3 = z3::ite(six != 0, z3::rem(six, six), six);
    z3::expr t_4 = z3::max(six, t_3);
    z3::expr t_6 = x - t_4;
    z3::expr t_7 = z3::abs(t_6);
    z3::expr t_8 = z3::ite(t_7 != 0, six / t_7, six);
    z3::expr t_9 = t_8 + t_6;
    z3::expr t_10 = z3::ite(x != 0, z3::rem(t_8, x), t_8);
    z3::expr in_1 = t_9 * t_10 * t_10;
    assert(ctx.check_error() == Z3_OK);

    z3::expr r_1 = z3::ite(in_0 == 0, in_1, in_1 / in_0);

    z3::solver solver(ctx);
    solver.add(r_1 != r_1);
    assert(solver.check() != z3::sat);
    assert(ctx.check_error() == Z3_OK);

    solver.reset();
    solver.push();
    solver.add(r_1 == 0);
    assert(solver.check() == z3::sat);
    solver.pop();
    assert(ctx.check_error() == Z3_OK);
}
