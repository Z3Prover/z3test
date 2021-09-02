#include <vector>
#include "z3++.h"

void
check_expr_same_sat(z3::expr e, z3::context& c)
{
        z3::solver solver(c);
        z3::expr conjecture = z3::operator==(e, e);
        solver.add(!conjecture);
        assert(solver.check() != z3::sat);
        assert(c.check_error() == Z3_OK);
}

int main()
{
    z3::context ctx;
    std::vector<z3::expr> vars;
    for (size_t i = 0; i < 68; ++i) {
        std::string new_var_name = "x" + std::to_string(i);
        z3::expr new_expr = ctx.int_const(new_var_name.c_str());
        vars.push_back(new_expr);
    }

    z3::expr x_1 = vars.at(1);
    z3::expr x_2 = vars.at(2);
    z3::expr x_67 = vars.at(67);

    z3::expr t_1 = ctx.int_val(5);
    z3::expr t_2 = t_1 - t_1;
    z3::expr t_3 = z3::abs(t_2);
    z3::expr t_4 = z3::rem(t_3, t_1);
    z3::expr t_5 = t_4 + t_1;
    z3::expr t_6 = t_4 / t_1;
    z3::expr t_7 = t_6 + x_1;

    z3::expr t_8 = z3::ite(x_2 != 0, z3::mod(t_7, x_2), t_7);
    z3::expr t_9 = z3::ite(t_8 != 0, t_5 / t_8, t_5);
    z3::expr t_10 = z3::min(t_9, t_5);
    z3::expr t_11 = z3::ite(t_6 != 0, z3::rem(t_2, t_6), t_2);
    z3::expr t_12 = -t_11;
    z3::expr t_13 = z3::ite(t_1 != 0, z3::rem(t_10, t_1), t_10);
    z3::expr t_14 = z3::ite(t_13 != 0, t_12 / t_13, t_12);
    z3::expr t_15 = z3::ite(x_67 != 0, t_14 / x_67, t_14);
    z3::expr t_16 = z3::ite(t_9 != 0, z3::rem(x_1, t_9), x_1);
    z3::expr t_17 = z3::ite(t_10 != 0, z3::mod(t_16, t_10), t_16);
    z3::expr t_18 = z3::min(t_11, t_17);
    z3::expr t_19 = z3::ite(t_9 != 0 && t_1 != 0, t_9.ctx().int_val(z3::pw(t_9, t_1)), t_9);
    z3::expr t_20 = z3::min(ctx.int_val(1), t_18 + t_19);
    z3::expr t_21 = z3::abs(t_20);
    z3::expr t_22 = z3::ite(t_21 != 0, t_17 / t_21, t_17);
    z3::expr t_23 = z3::ite(t_22 != 0, z3::rem(t_7, t_22), t_7);
    z3::expr t_24 = z3::max(z3::abs(t_16), t_23);
    z3::expr t_25 = z3::ite(t_24 != 0, z3::mod(t_20, t_24), t_20);
    z3::expr t_26 = z3::max(x_67, t_25);
    z3::expr t_27 = z3::max(t_15, t_26);

    z3::expr in = z3::ite(t_27 != 0, z3::mod(t_10, t_27), t_10);
    assert(ctx.check_error() == Z3_OK);

    class z3::expr r_1 = in * in;

    check_expr_same_sat(r_1, ctx);

    z3::solver solver(ctx);
    solver.push();
    solver.add(z3::operator==(r_1, 0));
    z3::check_result result_1 = solver.check();
    assert(ctx.check_error() == Z3_OK);
    z3::expr zero_val = ctx.int_val(0);
    solver.pop();
    solver.push();
    solver.add(z3::operator==(r_1, 0));
    z3::check_result result_2 = solver.check();
    solver.pop();
    assert(ctx.check_error() == Z3_OK);
}
