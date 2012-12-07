using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" },
            { "PROOF_MODE", "2" } };

        using (Context ctx = new Context(cfg))
        {
            ArrayExpr AllOne = ctx.MkConstArray(ctx.IntSort, ctx.MkInt(1));

            IntExpr a = ctx.MkIntConst("a");
            IntExpr i = ctx.MkIntConst("i");

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkEq(a, ctx.MkSelect(AllOne, i)));            
            Console.WriteLine(s.Check());

            s = ctx.MkSolver();
            s.Assert(ctx.MkEq(a, ctx.MkSelect(AllOne, i)));
            s.Assert(ctx.MkNot(ctx.MkEq(a, ctx.MkInt(1))));
            Console.WriteLine(s.Check());
        }
    }
}