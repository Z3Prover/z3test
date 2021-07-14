#include "z3++.h"

z3::expr mod_by_sub(z3::expr t1, z3::expr t2)
{
    z3::expr t1_div_t2 = z3::ite(t2 == 0, t1, t1 / t2);
    z3::expr t1_sub_t2_mul_div = t1 - t2 * t1_div_t2;
    return z3::ite(t2 == 0, t1, t1_sub_t2_mul_div);
}

z3::expr mod_by_sub_with_simplify(z3::expr t1, z3::expr t2)
{
    t1 = t1.simplify();
    z3::expr t1_div_t2 = z3::ite(t2 == 0, t1, t1 / t2);
    z3::expr t1_sub_t2_mul_div = t1 - t2 * t1_div_t2;
    return z3::ite(t2 == 0, t1, t1_sub_t2_mul_div);
}

int main()
{
    z3::context ctx;
    z3::expr free_0 = ctx.int_const("x_0");
    z3::expr free_1 = ctx.int_const("x_1");

    z3::expr in_0 = ctx.int_val(4);

    z3::expr e_1 = ctx.int_val(1);
    z3::expr e_3 = z3::operator-(free_0, free_0); // 0
    z3::expr e_4 = z3::min(e_1, e_3); // 0
    z3::expr e_5 = z3::ite(e_3 != 0, z3::mod(free_1, e_3), free_1); // ite(false, mod(x_1, 0), x_1) == x_1
    z3::expr e_6 = z3::operator-(e_4, e_5); // -x_1
    z3::expr e_7 = z3::operator-(e_1, e_6); // 1 + x_1
    z3::expr e_8 = ctx.int_val(1);
    z3::expr e_9 = z3::ite(e_7 != 0 && e_8 != 0,
        e_7.ctx().int_val(z3::pw(e_7, e_8)), e_7);
        // ite(1 + x_1 != 0 && true, int_val(pw(1+x_1, 1)), 1 + x_1) = 1 + x_1
    z3::expr e_10 = ctx.int_val(0);
    z3::expr e_11 = z3::max(e_9, e_10); // max(0, 1+x_1)
    z3::expr e_12 = z3::abs(e_11); // abs(max(0, 1+x_1))
    z3::expr in_1 = z3::min(e_7, e_12); // min(1+x_1, abs(max(0, 1+x_1)))
    assert(ctx.check_error() == Z3_OK);

    z3::solver slv(ctx);

    // We construct two equivalent expressions, by leveraging that fact that
    // `mod(x, y) = x - y * x / y` when using integer division
    z3::expr out_0 = z3::ite(in_1 == 0, in_1, z3::mod(in_1, in_1));
    out_0 = z3::ite(in_0 == 0, out_0, z3::mod(out_0, in_0));
    out_0 = out_0 + in_1;

    class z3::expr out_1 = mod_by_sub(in_1, in_1);
    out_1 = mod_by_sub_with_simplify(out_1, in_0);
    out_1 = out_1 + in_1;

    // Check same SAT
    slv.add(out_1 != out_0);
    assert(slv.check() != z3::sat);
    assert(ctx.check_error() == Z3_OK);
    slv.reset();

    // Check is zero
    slv.push();
    slv.add(out_1 == 0);
    assert(slv.check() == z3::sat);
    slv.pop();
    assert(ctx.check_error() == Z3_OK);
}
