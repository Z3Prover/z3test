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
            BitVecExpr x = ctx.MkBVConst("x", 32);
            BitVecExpr y = ctx.MkBVConst("y", 32);
            BitVecExpr zero = ctx.MkBV(0, 32);

            BoolExpr trick = ctx.MkBVSLT(ctx.MkBVXOR(x, y), zero);

            BoolExpr opposite = ctx.MkOr(ctx.MkAnd(ctx.MkBVSLT(x, zero), ctx.MkBVSGE(y, zero)),
                                         ctx.MkAnd(ctx.MkBVSGE(x, zero), ctx.MkBVSLT(y, zero)));

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkNot(ctx.MkEq(trick, opposite)));
            Console.WriteLine(s.Check());
            
        }
    }
}