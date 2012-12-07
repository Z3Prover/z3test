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

            Quantifier qf = ctx.MkForall(new Expr[] { x, y }, ctx.MkEq(f[x, y], ctx.MkInt(0)));
            Console.WriteLine(qf.Body);

            Expr v1 = qf.Body.Args[0].Args[0];
            Console.WriteLine(v1);
            Console.WriteLine(v1 == ctx.MkBound(1, ctx.IntSort));
        }
    }
}