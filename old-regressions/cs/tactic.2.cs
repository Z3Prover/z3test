
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

            Goal g = ctx.MkGoal();
            g.Assert(ctx.MkOr(ctx.MkLt(x, ctx.MkReal(0)),
                              ctx.MkGt(x, ctx.MkReal(0))));
            g.Assert(ctx.MkEq(x, ctx.MkAdd(y, ctx.MkReal(1))));
            g.Assert(ctx.MkLt(y, ctx.MkReal(0)));

            Tactic t = ctx.MkTactic("split-clause");
            ApplyResult ar = t[g];
            foreach (var sg in ar.Subgoals)
                Console.WriteLine(sg);
            
        }
    }
}