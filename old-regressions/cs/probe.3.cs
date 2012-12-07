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
            RatNum zero = ctx.MkReal(0);
            RatNum two = ctx.MkReal(2);

            Goal g = ctx.MkGoal();

            g.Assert(ctx.MkGe(ctx.MkSub(ctx.MkPower(x, two), ctx.MkPower(y, two)), zero));

            Probe p = ctx.MkProbe("num-consts");
            Probe p2 = ctx.Gt(p, ctx.Const(2));
            Tactic t = ctx.Cond(p2, ctx.MkTactic("simplify"), ctx.MkTactic("factor"));

            Console.WriteLine(t[g]);

            g = ctx.MkGoal();
            g.Assert(ctx.MkGe(ctx.MkAdd(x, x, y, z), zero));
            g.Assert(ctx.MkGe(ctx.MkSub(ctx.MkPower(x, two), ctx.MkPower(y, two)), zero));

            Console.WriteLine(t[g]);
        }
    }
}