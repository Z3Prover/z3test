
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            Sort U = ctx.MkUninterpretedSort("U");
            Console.WriteLine(U);
            Expr a = ctx.MkConst("a", U);

            a = ctx.MkConst("a", U);
            Expr b = ctx.MkConst("b", U);
            Expr c = ctx.MkConst("c", U);

            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");

            Console.WriteLine(ctx.MkAnd(ctx.MkEq(a, b), ctx.MkEq(a, c)));
            Console.WriteLine(U == ctx.IntSort);

            Sort U2 = ctx.MkUninterpretedSort("U");
            Console.WriteLine(U == U2);

            U2 = ctx.MkUninterpretedSort("U2");
            Console.WriteLine(U == U2);
            Console.WriteLine(ctx.MkDistinct(a, b, c));

            FuncDecl f = ctx.MkFuncDecl("f", new Sort[] { U, U }, U);
            Console.WriteLine(ctx.MkEq(f[a,b], b));
        }
    }
}