
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
            Expr x = ctx.MkConst("x", ctx.IntSort);

            Console.WriteLine(x == ctx.MkIntConst("x"));

            BoolExpr a = (BoolExpr)ctx.MkConst("a", ctx.BoolSort);
            BoolExpr b = (BoolExpr)ctx.MkConst("b", ctx.BoolSort);
            Console.WriteLine(ctx.MkAnd(a, b));
        }
    }
}