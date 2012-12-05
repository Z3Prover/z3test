using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" },
            { "MODEL", "true" } };

        using (Context ctx = new Context(cfg))
        {
            RealExpr x = ctx.MkRealConst("x");
            RealExpr y = ctx.MkRealConst("y");

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkAnd(ctx.MkEq(ctx.MkAdd(x, ctx.MkReal("10000000000000000000000")), y),
                               ctx.MkGt(y, ctx.MkReal("20000000000000000"))));
            s.Check();

            Console.WriteLine(s.Model);

            Expr q = ctx.MkAdd(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)),
                                        ctx.MkPower(ctx.MkReal(3), ctx.MkReal(1, 2)));

            Console.WriteLine(q);

            AlgebraicNum an = (AlgebraicNum)q.Simplify();

            Console.WriteLine(an);

            Console.WriteLine("[" + an.ToLower(10) + "," + an.ToUpper(10) + "]");
            Console.WriteLine(an.ToDecimal(10));
        }
    }
}