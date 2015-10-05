
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public BoolExpr DependsOn(Context ctx, BoolExpr pack, BoolExpr[] deps)
    {
        BoolExpr[] q = new BoolExpr[deps.Length];
        for (uint i = 0; i < deps.Length; i++)
            q[i] = ctx.MkImplies(pack, deps[i]);
        return ctx.MkAnd(q);
    }

    public BoolExpr Conflict(Context ctx, BoolExpr p1, BoolExpr p2)
    {
        return ctx.MkOr(ctx.MkNot(p1), ctx.MkNot(p2));
    }

    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" } };

        using (Context ctx = new Context(cfg))
        {
            BoolExpr a = ctx.MkBoolConst("a");
            BoolExpr b = ctx.MkBoolConst("b");
            BoolExpr c = ctx.MkBoolConst("c");
            BoolExpr d = ctx.MkBoolConst("d");
            BoolExpr e = ctx.MkBoolConst("e");
            BoolExpr f = ctx.MkBoolConst("f");
            BoolExpr g = ctx.MkBoolConst("g");
            BoolExpr z = ctx.MkBoolConst("z");

            Solver s = ctx.MkSolver();

            s.Assert(DependsOn(ctx, a, new BoolExpr[] { b, c, z }));
            s.Assert(DependsOn(ctx, b, new BoolExpr[] { d }));
            s.Assert(DependsOn(ctx, c, new BoolExpr[] { ctx.MkOr(d, e), ctx.MkOr(f, g) }));
            s.Assert(Conflict(ctx, d, e));
            s.Assert(a);
            s.Assert(z);

            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}