#include <vector>
#include "z3++.h"

z3::expr
arbitrary_expr(z3::context& ctx, std::vector<z3::expr>& vars)
{
    z3::expr zero = ctx.int_val(0);
    z3::expr x_13 = vars.at(13);
    z3::expr x_50 = vars.at(50);

    z3::expr t_add = x_13 + x_50;
    return z3::ite(t_add != 0, z3::rem(zero, t_add), zero);
}

z3::expr
zero_by_div(z3::context& ctx, std::vector<z3::expr>& vars, z3::expr t)
{
    z3::expr arbitrary = arbitrary_expr(ctx, vars);
    return z3::ite(arbitrary == 0, ctx.int_val(0), 0 / arbitrary);
}

z3::expr
obfuscated_one(z3::context& ctx, std::vector<z3::expr>& vars, z3::expr t)
{
    z3::expr tmp_zero = zero_by_div(ctx, vars, t);
    z3::expr one = z3::ite(0 == t, ctx.int_val(1), t / t);
    return z3::ite(tmp_zero == t, one, z3::ite(t == 0, t, t / t));
}

z3::expr
zero_by_mod_one(z3::context& ctx, std::vector<z3::expr>& vars, z3::expr t)
{
    z3::expr one = obfuscated_one(ctx, vars, t);
    return z3::ite(one == 0, t, z3::mod(t, one));
}

z3::expr
neg_by_sub_zero(z3::context& ctx, std::vector<z3::expr>& vars, z3::expr t)
{
    z3::expr zero = zero_by_mod_one(ctx, vars, t);
    return zero - t;
}

int main()
{
    z3::context ctx;
    std::vector<z3::expr> vars;
    for (size_t i = 0; i < 64; ++i) {
        std::string new_var_name = "x" + std::to_string(i);
        z3::expr new_expr = ctx.int_const(new_var_name.c_str());
        vars.push_back(new_expr);
    }

    z3::expr t_1 = ctx.int_val(4);
    z3::expr x_2 = vars.at(2);
    z3::expr x_63 = vars.at(63);

    // Create arbitrary expr in_0
    z3::expr t_2 = t_1 + t_1;
    z3::expr t_3 = t_2 + t_2;
    z3::expr t_4 = t_3 + t_3;
    z3::expr t_5 = z3::min(t_4, t_3);
    z3::expr t_6 = t_5 + t_1;
    z3::expr t_7 = z3::ite(t_6 != 0 && t_3 != 0, ctx.int_val(z3::pw(t_6, t_3)), t_6);
    z3::expr t_8 = z3::max(t_5, t_3);
    z3::expr t_9 = z3::ite(t_6 != 0 && t_6 != 0, ctx.int_val(z3::pw(t_6, t_6)), t_6);
    z3::expr t_10 = z3::max(t_7, t_9);
    z3::expr t_11 = t_6 - t_10;
    z3::expr t_12 = t_11 + x_63;
    z3::expr t_13 = -t_4;
    z3::expr t_14 = z3::max(t_13, t_12);
    z3::expr t_15 = z3::ite(t_14 != 0, z3::mod(t_1, t_14), t_1);
    z3::expr t_16 = t_12 * t_15;
    z3::expr t_17 = z3::ite(x_63 != 0, z3::rem(t_2, x_63), t_2);
    z3::expr t_18 = t_8 * t_5;
    z3::expr t_19 = z3::ite(x_63 != 0, z3::mod(t_10, x_63), t_10);
    z3::expr t_20 = z3::max(t_19, t_8);
    z3::expr t_21 = z3::ite(t_20 != 0, z3::rem(t_3, t_20), t_3);
    z3::expr t_22 = z3::ite(t_5 != 0, t_21 / t_5, t_21);
    z3::expr t_23 = z3::min(t_19, t_1);
    z3::expr t_24 = z3::ite(t_23 != 0, z3::rem(t_22, t_23), t_22);
    z3::expr t_25 = z3::min(t_18, t_24);
    z3::expr t_26 = z3::ite(t_6 != 0, t_6 / t_6, t_6);
    z3::expr t_27 = z3::min(t_25, t_26);
    z3::expr in_0 = t_16 * t_17 * (t_27 + t_23);

    // Create arbitrary expr in_1
    z3::expr t_29 = z3::abs(x_2);
    z3::expr t_30 = z3::ite(x_2 != 0, z3::mod(x_2, x_2), x_2);
    z3::expr t_31 = t_29 - t_30;
    z3::expr t_32 = z3::ite(t_30 != 0, z3::mod(t_29, t_30), t_29);
    z3::expr t_33 = z3::ite(t_29 != 0, z3::mod(x_2, t_29), x_2);
    z3::expr t_34 = t_32 + t_33;
    z3::expr t_35 = z3::abs(t_34);
    z3::expr t_36 = z3::ite(t_35 != 0, z3::rem(t_31, t_35), t_31);
    z3::expr in_1 = z3::max(x_2, -t_36);
    assert(ctx.check_error() == Z3_OK);

    // Create r_0 and r_1 which are expected to be equal by construction
    z3::expr r_0 = z3::ite(in_1 == 0, in_0, in_0 / in_1);
    r_0 = neg_by_sub_zero(ctx, vars, r_0);
    r_0 = r_0 * in_1;
    r_0 = z3::ite(in_0 == 0, r_0, r_0 / in_0);

    z3::expr r_1 = z3::ite(in_1 == 0, in_0, in_0 / in_1);
    r_1 = -r_1;
    r_1 = r_1 * in_1;
    r_1 = z3::ite(in_0 == 0, r_1, r_1 / in_0);

    z3::solver solver(ctx);
    solver.add(r_1 != r_0);
    assert(solver.check() != z3::sat);
    assert(ctx.check_error() == Z3_OK);
}
