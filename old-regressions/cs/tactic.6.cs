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
            BitVecExpr x = ctx.MkBVConst("x", 16);
            BitVecExpr y = ctx.MkBVConst("y", 16);

            Tactic t = ctx.Then(ctx.MkTactic("simplify"), ctx.MkTactic("solve-eqs"), ctx.MkTactic("bit-blast"), ctx.MkTactic("sat"));
            Solver s = ctx.MkSolver(t);

            s.Assert(ctx.MkEq(ctx.MkBVOR(x, y), ctx.MkBV(13, 16)));
            s.Assert(ctx.MkBVSGT(x, y));
            
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}