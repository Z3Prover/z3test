
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
            BoolExpr p1 = ctx.MkBoolConst("p1");
            BoolExpr p2 = ctx.MkBoolConst("p2");
            BoolExpr p3 = ctx.MkBoolConst("p3");

            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");

            Solver s = ctx.MkSolver();

            s.Assert(ctx.MkImplies(p1, ctx.MkGt(x, ctx.MkInt(10))),
                     ctx.MkImplies(p1, ctx.MkGt(y, x)),
                     ctx.MkImplies(p2, ctx.MkLt(y, ctx.MkInt(5))),
                     ctx.MkImplies(p3, ctx.MkGt(y, ctx.MkInt(0))));

            Console.WriteLine(s);
            Console.WriteLine(s.Check(p1, p2, p3));
            Console.WriteLine("Core: ");
            foreach (Expr e in s.UnsatCore)
                Console.WriteLine(e);

            Console.WriteLine(s.Check(p1, p3));
            Console.WriteLine(s.Model);
        }
    }
}