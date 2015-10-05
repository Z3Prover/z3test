
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

    public BoolExpr Conflict(Context ctx, params BoolExpr[] packs)
    {
        BoolExpr q = ctx.MkFalse();
        foreach (BoolExpr p in packs)
            q = ctx.MkOr(q, ctx.MkNot(p));
        return q;
    }

    public void InstallCheck(Context ctx, BoolExpr[] p)
    {
        Solver s = ctx.MkSolver();

        s.Assert(p);

        if (s.Check() == Status.SATISFIABLE)
        {
            Model m = s.Model;            
            foreach (FuncDecl f in m.ConstDecls)
            {
                if (m.ConstInterp(f).IsTrue)
                    Console.WriteLine(f.Name);             
            }
        }
        else
            Console.WriteLine("invalid installation profile");
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

            Console.WriteLine("Check 1");
            InstallCheck(ctx, new BoolExpr[] { 
                                DependsOn(ctx, a, new BoolExpr[] { b, c, z }), 
                                DependsOn(ctx, b, new BoolExpr[] { d }),
                                DependsOn(ctx, c, new BoolExpr[] { ctx.MkOr(d, e), ctx.MkOr(f, g) }),
                                Conflict(ctx, d, e),
                                Conflict(ctx, d, g),
                                a, z });

            Console.WriteLine("Check 2");
            InstallCheck(ctx, new BoolExpr[] { 
                                DependsOn(ctx, a, new BoolExpr[] { b, c, z }), 
                                DependsOn(ctx, b, new BoolExpr[] { d }),
                                DependsOn(ctx, c, new BoolExpr[] { ctx.MkOr(d, e), ctx.MkOr(f, g) }),
                                Conflict(ctx, d, e),
                                Conflict(ctx, d, g),
                                a, z, g });
        }
    }
}