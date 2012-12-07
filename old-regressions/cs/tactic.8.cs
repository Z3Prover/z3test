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
            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");

            Solver s = ctx.MkTactic("smt").Solver;

            s.Assert(ctx.MkGt(x, ctx.MkAdd(y, ctx.MkInt(1))));
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}