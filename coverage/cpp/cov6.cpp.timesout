#include <vector>
#include "z3++.h"

void
check_expr_same_sat(z3::context& c, z3::expr e1, z3::expr e2)
{
	z3::solver solver(c);
	z3::expr conjecture = z3::operator==(e1, e2);
	solver.add(!conjecture);
	assert(solver.check() != z3::sat);
	assert(c.check_error() == Z3_OK);
}

z3::expr
obfuscated_identity(z3::expr t)
{
    z3::expr abs_t = z3::ite(t > t.ctx().int_val(0), t, z3::abs(t));
    return z3::ite(t == abs_t, abs_t, t);
}

z3::expr
obfuscated_sub(z3::expr t1, z3::expr t2)
{
	return -obfuscated_identity(-t1) - t2;
}

int main()
{
    z3::context ctx;
    std::vector<z3::expr> vars;
    for (size_t i = 0; i < 85; ++i) {
        std::string new_var_name = "x" + std::to_string(i);
        z3::expr new_expr = ctx.int_const(new_var_name.c_str());
        vars.push_back(new_expr);
    }

    z3::expr x_1 = vars.at(1);
    z3::expr x_84 = vars.at(84);
    z3::expr zero = ctx.int_val(0);

    z3::expr t_1 = z3::ite(x_84 != 0 && x_84 != 0, ctx.int_val(z3::pw(x_84, x_84)), x_84);
    z3::expr t_2 = z3::ite(t_1 != 0, t_1 / t_1, t_1);
    z3::expr t_3 = t_2 * t_2;
    z3::expr t_4 = t_3 + t_1;
    z3::expr t_5 = t_4 - t_3;
    z3::expr t_6 = z3::ite(t_2 != 0, x_84 / t_2, x_84);
    z3::expr t_7 = z3::ite(t_3 != 0, t_5 / t_3, t_5);
    z3::expr t_8 = z3::ite(t_7 != 0, t_6 / t_7, t_6);
    z3::expr t_9 = t_5 + t_8;
    z3::expr t_10 = t_9 - zero;
    z3::expr t_11 = t_5 + t_2;
    z3::expr t_12 = t_11 + t_4;
    z3::expr t_13 = -t_12;
    z3::expr t_14 = z3::ite(t_13 != 0, z3::rem(t_8, t_13), t_8);
    z3::expr t_15 = z3::ite(t_14 != 0 && t_9 != 0, ctx.int_val(z3::pw(t_14, t_9)), t_14);
    z3::expr t_16 = z3::ite(t_15 != 0, t_3 / t_15, t_3);
    z3::expr t_17 = t_16 + t_7;
    z3::expr t_18 = z3::min(t_8, t_17);
    z3::expr t_19 = -t_18;
    z3::expr t_20 = z3::ite(t_18 != 0, z3::rem(t_11, t_18), t_11);
    z3::expr t_21 = z3::ite(t_19 != 0 && t_20 != 0, ctx.int_val(z3::pw(t_19, t_20)), t_19);
    z3::expr t_22 = z3::ite(t_12 != 0 && t_21 != 0, ctx.int_val(z3::pw(t_12, t_21)), t_12);
    z3::expr t_23 = z3::max(t_10, t_22);
    z3::expr in_0 = z3::ite(x_1 != 0, z3::rem(t_23, x_1), t_23);

    /* Template initialisation for output var 1 */
    z3::expr t_24 = z3::max(x_84, zero);
    z3::expr t_25 = z3::ite(t_24 != 0 && zero != 0, ctx.int_val(z3::pw(t_24, zero)), t_24);
    z3::expr t_26 = z3::min(zero, t_25);
    z3::expr t_28 = z3::ite(zero != 0 && zero != 0, ctx.int_val(z3::pw(zero, zero)), zero);
    z3::expr t_29 = z3::ite(t_28 != 0, z3::mod(t_25, t_28), t_25);
    z3::expr in_1 = t_26 + t_29;

    assert(ctx.check_error() == Z3_OK);

    // Meta test 0
    z3::expr r_0 = z3::ite(in_1 == ctx.int_val(0), in_0, in_0 / in_1);
    r_0 = obfuscated_sub(r_0, in_1);
    r_0 = z3::ite(in_1 == ctx.int_val(0), r_0, r_0 / in_1);

    // Meta test 1
    z3::expr r_1 = z3::ite(in_1 == ctx.int_val(0), in_0, in_0 / in_1);
    r_1 = r_1 - in_1;
    r_1 = z3::ite(in_1 == ctx.int_val(0), r_1, r_1 / in_1);

    check_expr_same_sat(ctx, r_1, r_0);
}
