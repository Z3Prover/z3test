
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
            Sort A = ctx.MkUninterpretedSort("A");
            Sort B = ctx.MkUninterpretedSort("B");

            FuncDecl f = ctx.MkFuncDecl("f", A, B);

            Expr a1 = ctx.MkConst("a1", A);
            Expr a2 = ctx.MkConst("a2", A);
            Expr b = ctx.MkConst("b", B);
            Expr x = ctx.MkConst("x", A);
            Expr y = ctx.MkConst("y", A);

            Solver s = ctx.MkSolver();
            

            s.Assert(ctx.MkNot(ctx.MkEq(a1, a2)));
            s.Assert(ctx.MkEq(f[a1], b));
            s.Assert(ctx.MkEq(f[a2], b));
            s.Assert(ctx.MkForall(new Expr[] { x, y }, ctx.MkImplies(ctx.MkEq(f[x], f[y]),
                                                                     ctx.MkEq(x, y)),
                                                       1,
                                                       new Pattern[] { ctx.MkPattern(f[x], f[y]) }));                     
            Console.WriteLine(s);
            Console.WriteLine(s.Check());
        }
    }
}