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

            Console.WriteLine(ctx.MkAdd(x, y) == ctx.MkAdd(x, y));
            Console.WriteLine(ctx.MkAdd(x, y) == ctx.MkAdd(y, x));

            ArithExpr n = ctx.MkAdd(x, y);

            Console.WriteLine(n == ctx.MkAdd(x, y));

            IntExpr x2 = ctx.MkIntConst("x");

            Console.WriteLine(x == x2);

            Console.WriteLine(ctx.MkIntConst("x") == ctx.MkRealConst("x"));            
        }
    }
}