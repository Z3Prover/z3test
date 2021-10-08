#include <vector>
#include "z3++.h"

z3::expr
mod_by_sub(z3::expr t1, z3::expr t2)
{
    z3::expr t1_div_t2 = z3::ite(t2 == 0, t1, t1 / t2);
    return z3::ite(t2 == 0, t1, t1 - t2 * t1_div_t2);
}

int main()
{
    z3::context ctx;
    std::vector<z3::expr> vars;
    for (size_t i = 0; i < 65; ++i) {
        std::string new_var_name = "x" + std::to_string(i);
        z3::expr new_expr = ctx.int_const(new_var_name.c_str());
        vars.push_back(new_expr);
    }

    /* Create in_0 */
    z3::expr x_50 = vars.at(50);
    z3::expr x_32 = vars.at(32);

    z3::expr t_1 = -x_50;
    z3::expr t_2 = z3::abs(x_50);
    z3::expr t_3 = z3::max(-x_32, t_2);
    z3::expr t_4 = z3::ite(t_3 != 0, z3::rem(t_1, t_3), t_1);
    z3::expr in_0 = z3::abs(t_4);

    /* Create in_1 */
    z3::expr x_22 = vars.at(22);
    z3::expr x_64 = vars.at(64);
    z3::expr zero = ctx.int_val(0);

    z3::expr t_6 = z3::min(x_22, zero);
    z3::expr t_7 = t_6 - x_22;
    z3::expr t_8 = z3::min(t_6, t_7);
    z3::expr t_9 = z3::ite(t_6 != 0, t_8 / t_6, t_8);
    z3::expr t_10 = z3::ite(t_9 != 0, z3::rem(t_7, t_9), t_7);
    z3::expr t_11 = z3::max(zero, t_10);
    z3::expr t_12 = z3::ite(t_10 != 0, z3::mod(x_22, t_10), x_22);
    z3::expr t_13 = z3::ite(t_11 != 0, z3::rem(t_11, t_11), t_11);
    z3::expr t_14 = z3::max(x_22, zero);
    z3::expr t_15 = t_14 + t_11;
    z3::expr t_16 = t_15 - t_15 - t_15;
    z3::expr t_17 = z3::ite(t_12 != 0, t_12 / t_12, t_12);
    z3::expr t_18 = t_17 - t_8;
    z3::expr t_19 = z3::max(t_18, x_64);
    z3::expr in_1 = z3::ite(t_19 != 0, z3::rem(t_16, t_19), t_16);
    assert(ctx.check_error() == Z3_OK);

    // r_0 and r_1 are expected to be equivalent by construction
    z3::expr r_0 = z3::ite(in_1 == 0, in_0, z3::mod(in_0, in_1));
    r_0 = r_0 + in_1;
    r_0 = z3::ite(in_0 == ctx.int_val(0), r_0, r_0 / in_0);

    z3::expr r_1 = mod_by_sub(in_0, in_1);
    r_1 = r_1 + in_1;
    r_1 = z3::ite(in_0 == ctx.int_val(0), r_1, r_1 / in_0);

    z3::solver solver(ctx);
    solver.add(r_1 != r_0);
    assert(solver.check() != z3::sat);
    assert(ctx.check_error() == Z3_OK);
}
