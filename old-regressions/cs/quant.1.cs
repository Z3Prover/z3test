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
            FuncDecl f = ctx.MkFuncDecl("f", new Sort[] { ctx.IntSort, ctx.IntSort }, ctx.IntSort);
            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");

            Console.WriteLine(ctx.MkForall(new Expr[] { x, y }, ctx.MkEq(f[x, y], ctx.MkInt(0))));
            Console.WriteLine(ctx.MkExists(new Expr[] { x }, ctx.MkGe((ArithExpr)f[x, x], ctx.MkInt(0))));

            IntExpr a = ctx.MkIntConst("a");
            IntExpr b = ctx.MkIntConst("b");

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkForall(new Expr[] { x }, ctx.MkEq(f[x, x], ctx.MkInt(0))));
            s.Assert(ctx.MkEq(f[a, b], ctx.MkInt(1)));
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}