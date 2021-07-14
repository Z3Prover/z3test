#include "z3++.h"

int
main()
{
	z3::context ctx;
	z3::expr x = ctx.int_const("x");
	z3::expr e1 = x * 4;

	z3::solver slv(ctx);
	slv.add(e1 != 8);
	assert(slv.check() == z3::sat);
	exit(0);
}

