
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
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" } };

        using (Context ctx = new Context(cfg))
        {
            RealExpr x = ctx.MkRealConst("x");
            RealExpr y = ctx.MkRealConst("y");

            RatNum zero = ctx.MkReal(0);
            RatNum two = ctx.MkReal(2);

            Goal g = ctx.MkGoal();
            g.Assert(ctx.MkGt(x, zero));
            g.Assert(ctx.MkGt(y, zero));
            g.Assert(ctx.MkEq(x, ctx.MkAdd(y, two)));
            Console.WriteLine(g);

            Tactic t1 = ctx.MkTactic("simplify");
            Tactic t2 = ctx.MkTactic("solve-eqs");
            Tactic t = ctx.AndThen(t1, t2);

            Console.WriteLine(t[g]);
        }
    }
}