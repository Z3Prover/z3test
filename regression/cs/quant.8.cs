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
            FuncDecl finv = ctx.MkFuncDecl("finv", B, A);

            Expr a1 = ctx.MkConst("a1", A);
            Expr a2 = ctx.MkConst("a2", A);
            Expr b = ctx.MkConst("b", B);
            Expr x = ctx.MkConst("x", A);
            Expr y = ctx.MkConst("y", A);

            Solver s = ctx.MkSolver();

            s.Assert(ctx.MkNot(ctx.MkEq(a1, a2)));
            s.Assert(ctx.MkEq(f[a1], b));
            s.Assert(ctx.MkEq(f[a2], b));
            s.Assert(ctx.MkForall(new Expr[] { x }, ctx.MkEq(finv[f[x]], x)));

            Console.WriteLine(s);
            Console.WriteLine(s.Check());
        }
    }
}