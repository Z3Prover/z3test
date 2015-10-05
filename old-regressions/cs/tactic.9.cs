
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
            Params p = ctx.MkParams();
            p.Add(":arith-lhs", true);
            p.Add(":som", true);

            Solver s = ctx.Then(ctx.With(ctx.MkTactic("simplify"), p),
                                ctx.MkTactic("normalize-bounds"),
                                ctx.MkTactic("lia2pb"),
                                ctx.MkTactic("pb2bv"),
                                ctx.MkTactic("bit-blast"),
                                ctx.MkTactic("sat")).Solver;

            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");
            IntExpr z = ctx.MkIntConst("z");

            s.Assert(new BoolExpr[] { ctx.MkGt(x, ctx.MkInt(0)),
                                      ctx.MkLt(x, ctx.MkInt(10)),
                                      ctx.MkGt(y, ctx.MkInt(0)),
                                      ctx.MkLt(y, ctx.MkInt(10)),
                                      ctx.MkGt(z, ctx.MkInt(0)),
                                      ctx.MkLt(z, ctx.MkInt(10)),
                                      ctx.MkEq(ctx.MkAdd(ctx.MkMul(ctx.MkInt(3), y), 
                                                         ctx.MkMul(ctx.MkInt(2), x)), z) });

            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);

            s.Reset();

            s.Assert(ctx.MkEq(ctx.MkAdd(ctx.MkMul(ctx.MkInt(3), y), 
                                        ctx.MkMul(ctx.MkInt(2), x)), z));

            Console.WriteLine(s.Check());
        }
    }
}