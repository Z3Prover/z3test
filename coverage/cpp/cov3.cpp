#include <vector>
#include "z3++.h"

z3::expr
add_zero(z3::context& ctx, z3::expr t)
{
    t = t.simplify();
    z3::expr zero = ctx.int_val(0);
    return t + z3::ite(t == zero, zero, zero / t);
}

z3::expr
arbitrary_expr(z3::context& ctx)
{

    z3::expr x = ctx.int_const("x_40");
    z3::expr t_1 = z3::abs(x - 8);
    z3::expr t_2 = z3::max(x, ctx.int_val(8));
    z3::expr t_3 = z3::ite(t_1 != 0 && t_2 != 0,
        ctx.int_val(z3::pw(t_1, t_2)), t_1);
    return t_3 * (t_2 * x + t_2);
}

z3::expr
neg_by_sub(z3::context& ctx, z3::expr t)
{
    z3::expr fuzz = arbitrary_expr(ctx);
    z3::expr zero = ctx.int_val(0);
    z3::expr one = z3::ite(zero == fuzz, ctx.int_val(1),
        z3::ite(fuzz == zero, fuzz, fuzz / fuzz));
    z3::expr two = one + ctx.int_val(1);
    return t - t * two;
}

int main()
{
    z3::context ctx;
    std::vector<z3::expr> fvs;
    for (size_t i = 0; i < 40; ++i) {
        std::string new_var_name = "x" + std::to_string(i);
        z3::expr new_expr = ctx.int_const(new_var_name.c_str());
        fvs.push_back(new_expr);
    }

    z3::expr x_1 = fvs.at(1);
    z3::expr x_2 = fvs.at(2);
    z3::expr in_0 = z3::max(x_1, -x_2);

    z3::expr x_38 = fvs.at(38);
    z3::expr x_39 = fvs.at(39);
    z3::expr t_1 = z3::ite(x_38 != 0, z3::mod(x_39, x_38), x_39);
    z3::expr t_2 = -t_1;
    z3::expr t_3 = z3::abs(x_39) * x_39;
    z3::expr t_4 = z3::ite(t_3 != 0, z3::rem(t_1, t_3), t_1);
    z3::expr t_5 = z3::ite(t_4 != 0, z3::mod(x_39, t_4), x_39);
    z3::expr t_6 = z3::ite(t_2 != 0 && t_5 != 0,
        ctx.int_val(z3::pw(t_2, t_5)), t_2);
    z3::expr t_7 = t_6 - ctx.int_val(4);
    z3::expr in_1 = z3::min(t_7, t_7 * t_5);

    assert(ctx.check_error() == Z3_OK);

    // Variables out_0 and out_1 expected to be equivalent by construction
    class z3::expr out_0 = z3::abs(in_0);
    out_0 = out_0 + in_1;
    out_0 = z3::ite(in_0 == 0, out_0, out_0 / in_0);
    out_0 = add_zero(ctx, out_0);

    class z3::expr out_1 = z3::ite(in_0 > 0, in_0, z3::abs(in_0));
    out_1 = out_1 + neg_by_sub(ctx, (-in_1).simplify());
    out_1 = z3::ite(in_0 == 0, out_1, out_1 / in_0);
    out_1 = out_1;

    z3::solver solver(ctx);
    solver.add(out_1 != out_0);
    assert(solver.check() != z3::sat);
    assert(ctx.check_error() == Z3_OK);
}
