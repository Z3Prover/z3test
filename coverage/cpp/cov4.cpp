#include "z3++.h"

int main()
{
    z3::context ctx;

    z3::expr x = ctx.int_const("x");
    z3::expr arbitrary = z3::abs(z3::rem(x, ctx.int_val(2)));
    arbitrary = arbitrary * arbitrary;

    z3::solver solver(ctx);
    solver.push();
    solver.add(z3::operator<(arbitrary, 5));
    assert(solver.check() == z3::sat);
    solver.pop();
    assert(ctx.check_error() == Z3_OK);
}
