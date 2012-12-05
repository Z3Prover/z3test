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

            Goal g = ctx.MkGoal();
            g.Assert(ctx.MkGt(ctx.MkAdd(x, y, z), ctx.MkReal(0)));

            Probe p = ctx.MkProbe("num-consts");
            Console.WriteLine("num-consts: " + p.Apply(g));

            Tactic t = ctx.FailIf(ctx.Gt(p, ctx.Const(2)));

            try
            {
                t.Apply(g);
            }
            catch (Z3Exception ex)
            {
                Console.WriteLine("Tactic failed: " + ex.Message);
            }

            Console.WriteLine("trying again...");

            g = ctx.MkGoal();
            g.Assert(ctx.MkGt(ctx.MkAdd(x, y), ctx.MkReal(0)));

            Console.WriteLine(t[g]);

        }
    }
}