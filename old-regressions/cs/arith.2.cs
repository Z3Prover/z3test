
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public void Run()
    {
        Dictionary<string, string> settings = new Dictionary<string, string>() { { "AUTO_CONFIG", "true" }, { "MODEL", "true" } };

        using (Context ctx = new Context(settings))
        {
            IntExpr a = ctx.MkIntConst("a");
            IntExpr b = ctx.MkIntConst("b");
            IntExpr c = ctx.MkIntConst("c");
            RealExpr d = ctx.MkRealConst("d");
            RealExpr e = ctx.MkRealConst("e");

            BoolExpr q = ctx.MkAnd(
                ctx.MkGt(a, ctx.MkAdd(b, ctx.MkInt(2))),
                ctx.MkEq(a, ctx.MkAdd(ctx.MkMul(ctx.MkInt(2), c), ctx.MkInt(10))),
                ctx.MkLe(ctx.MkAdd(c, b), ctx.MkInt(1000)),
                ctx.MkGe(d, e));

            Solver s = ctx.MkSolver();
            s.Assert(q);

            Console.WriteLine(s.Check());

            Console.WriteLine(s.Model);
        }
    }
}