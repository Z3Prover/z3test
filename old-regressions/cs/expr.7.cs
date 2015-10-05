
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
            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");

            FuncDecl f = ctx.MkFuncDecl("f", new Sort[] { ctx.IntSort, ctx.IntSort }, ctx.IntSort);
            FuncDecl g = ctx.MkFuncDecl("g", new Sort[] { ctx.IntSort }, ctx.IntSort);
            Expr n = f[f[g[x], g[g[x]]], g[g[y]]];

            Console.WriteLine(n);

            Expr nn = n.Substitute(new Expr[] { g[g[x]], g[y] }, 
                                   new Expr[] { y, ctx.MkAdd(x, ctx.MkInt(1)) } );

            Console.WriteLine(nn);

            Console.WriteLine(n.Substitute(g[g[x]], y));
        }
    }
}