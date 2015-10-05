
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
            BoolExpr p = ctx.MkBoolConst("p");
            Console.WriteLine(ctx.MkNot(p));
            Console.WriteLine(ctx.MkNot(p));
            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");

            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt(1)));
            Console.WriteLine(ctx.MkAdd(ctx.MkInt(1), x));
            Console.WriteLine(ctx.MkAdd(x, y));
            Console.WriteLine(ctx.MkMul(ctx.MkInt(2), x));
            Console.WriteLine(ctx.MkMul(x, ctx.MkInt(2)));
            Console.WriteLine(ctx.MkMul(x, y));
            Console.WriteLine(ctx.MkDiv(x, y));
            Console.WriteLine(ctx.MkMod(x, y));
            Console.WriteLine(ctx.MkEq(x, y));
            Console.WriteLine(ctx.MkDistinct(x, y, x));
            Console.WriteLine(ctx.MkNot(ctx.MkEq(x, y)));
            Console.WriteLine(ctx.MkEq(x, y));
            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt(1)));
            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt(1)));

            BoolExpr q = ctx.MkBoolConst("q");
            Console.WriteLine(ctx.MkNot(p));
            Console.WriteLine(ctx.MkNot(p));
            Console.WriteLine(ctx.MkAnd(p, q));
            Console.WriteLine(ctx.MkAnd(p, q));
            Console.WriteLine(ctx.MkEq(x, y));
        }
    }
}