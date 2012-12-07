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

            Params p = ctx.MkParams();
            p.Add(":mul2concat", true);

            Tactic t = ctx.Then(ctx.UsingParams(ctx.MkTactic("simplify"), p), 
                                ctx.MkTactic("solve-eqs"), 
                                ctx.MkTactic("bit-blast"), 
                                ctx.MkTactic("aig"),
                                ctx.MkTactic("sat"));
            Solver s = ctx.MkSolver(t);

            s.Assert(ctx.MkEq(ctx.MkBVAdd(ctx.MkBVMul(x, ctx.MkBV(32, 16)), y), ctx.MkBV(13, 16)));
            s.Assert(ctx.MkBVSLT(ctx.MkBVAND(x, y), ctx.MkBV(10, 16)));
            s.Assert(ctx.MkBVSGT(y, ctx.MkBV(-100, 16)));

            Console.WriteLine(s.Check());
            Model m = s.Model;
            Console.WriteLine(m);

            Console.WriteLine(ctx.MkBVAdd(ctx.MkBVMul(x, ctx.MkBV(32, 16)), y) + " == " + m.Evaluate(ctx.MkBVAdd(ctx.MkBVMul(x, ctx.MkBV(32, 16)), y)));
            Console.WriteLine(ctx.MkBVAND(x, y) + " == " + m.Evaluate(ctx.MkBVAND(x, y)) );
        }
    }
}