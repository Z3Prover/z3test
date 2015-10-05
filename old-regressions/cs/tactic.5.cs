
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
            RealExpr z = ctx.MkRealConst("z");

            RealExpr zero = ctx.MkReal(0);
            RealExpr one = ctx.MkReal(1);

            Goal g = ctx.MkGoal();
            g.Assert(ctx.MkOr(ctx.MkEq(x, zero), ctx.MkEq(x, one)));
            g.Assert(ctx.MkOr(ctx.MkEq(y, zero), ctx.MkEq(y, one)));
            g.Assert(ctx.MkOr(ctx.MkEq(z, zero), ctx.MkEq(z, one)));
            g.Assert(ctx.MkGt(ctx.MkAdd(x, y, z), ctx.MkReal(2)));

            Tactic t = ctx.Repeat(ctx.OrElse(ctx.MkTactic("split-clause"), ctx.MkTactic("skip")));
            ApplyResult ar = t[g];
            foreach (var sg in ar.Subgoals)
                Console.WriteLine(sg);
        }
    }
}