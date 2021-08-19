#include <vector>
#include "z3++.h"

z3::expr
mod_by_sub(z3::expr t1, z3::expr t2)
{
    t1 = t1.simplify();
    z3::expr t1_div_t2 = t1 / t2;
    return z3::ite(t2 == 0, t1, t1 - t2 * t1_div_t2);
}

void
check_expr_same_sat(z3::context& c, z3::expr e1, z3::expr e2)
{
    z3::solver solver(c);
    z3::expr conjecture = z3::operator==(e1, e2);
    solver.add(!conjecture);
    assert(solver.check() != z3::sat);
    assert(c.check_error() == Z3_OK);
}

int main(int argc, char** argv)
{
    z3::context ctx;
    std::vector<z3::expr> fvs;
    for (size_t i = 0; i < 63; ++i) {
        std::string new_var_name = "x" + std::to_string(i);
        z3::expr new_expr = ctx.int_const(new_var_name.c_str());
        fvs.push_back(new_expr);
    }

    z3::expr x_5 = fvs.at(5);
    z3::expr x_62 = fvs.at(62);

    z3::expr e_1 = z3::abs(x_5) * x_5;
    z3::expr e_2 = z3::ite(e_1 != 0 && e_1 != 0, e_1.ctx().int_val(z3::pw(e_1, e_1)), e_1);
    z3::expr e_3 = z3::ite(x_5 != 0, z3::mod(e_2, x_5), e_2);
    z3::expr e_4 = z3::ite(x_62 != 0, e_3 / x_62, e_3);
    z3::expr e_5 = x_5 - x_62;
    z3::expr e_6 = z3::ite(e_5 != 0, e_4 / e_5, e_4);
    z3::expr e_7 = z3::ite(e_3 != 0, z3::rem(e_4, e_3), e_4);
    z3::expr e_8 = z3::max(e_7, x_62);
    z3::expr e_9 = -(x_62 - e_8);
    z3::expr e_10 = z3::min(e_8, e_9);
    z3::expr e_11 = z3::ite(e_5 != 0, z3::mod(e_1, e_5), e_1);
    z3::expr e_12 = e_10 - e_11;
    z3::expr e_13 = -e_5;
    z3::expr e_14 = z3::ite(e_6 != 0 && e_1 != 0, e_6.ctx().int_val(z3::pw(e_6, e_1)), e_6);
    z3::expr e_15 = z3::min(e_6, e_14);
    z3::expr e_16 = z3::ite(e_10 != 0, z3::rem(e_9, e_10), e_9);
    z3::expr e_17 = z3::ite(e_12 != 0, e_13 / e_12, e_13);
    z3::expr e_18 = z3::max(e_15 * e_16, e_17);
    z3::expr arbitrary = z3::abs(e_18);
    assert(ctx.check_error() == Z3_OK);

    // Variables expected to be equivalent by construction
    // Meta test 0
    z3::expr meta_var_0 = z3::ite(arbitrary == 0, arbitrary, z3::mod(arbitrary, arbitrary));
    meta_var_0 = z3::ite(arbitrary == 0, meta_var_0, meta_var_0 / arbitrary);
    meta_var_0 = z3::ite(meta_var_0 > 0, meta_var_0, z3::abs(meta_var_0));

    // Meta test 1
    z3::expr meta_var_1 = mod_by_sub(arbitrary, arbitrary);
    meta_var_1 = z3::ite(arbitrary == 0, meta_var_1, meta_var_1 / arbitrary);
    meta_var_1 = z3::ite(!(meta_var_1 <= ctx.int_val(0)), meta_var_1, z3::abs(meta_var_1));

    check_expr_same_sat(ctx, meta_var_1, meta_var_0);

    z3::solver solver(ctx);
    solver.push();
    solver.add(z3::operator==(meta_var_1, 0));
    z3::check_result result_1 = solver.check();
    assert(ctx.check_error() == Z3_OK);
    z3::model mdl_1(ctx);
    if (result_1 == z3::sat)
    {
        mdl_1 = solver.get_model();
        for (z3::expr e : fvs)
        {
            z3::func_decl cnst_decl = e.decl();
            if (!mdl_1.has_interp(cnst_decl))
            {
                z3::expr zero_val = ctx.int_val(0);
            }
        }
    }
    solver.pop();
    solver.push();
    solver.add(z3::operator==(meta_var_0, 0));
    z3::check_result result_2 = solver.check();
    solver.pop();
    assert(ctx.check_error() == Z3_OK);
}
