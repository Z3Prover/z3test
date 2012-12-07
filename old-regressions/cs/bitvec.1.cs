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
            BitVecExpr x = ctx.MkBVConst("x", 16);
            BitVecExpr y = ctx.MkBVConst("y", 16);

            Console.WriteLine(ctx.MkBVAdd(x, ctx.MkBV(2, 16)));

            Console.WriteLine(ctx.MkBVSub(ctx.MkBVAdd(x, y), ctx.MkBV(1, 16)).Simplify());

            BitVecExpr a = ctx.MkBV(-1, 16);
            BitVecExpr b = ctx.MkBV(65535, 16);
            Console.WriteLine(ctx.MkEq(a, b).Simplify());

            a = ctx.MkBV(-1, 32);
            b = ctx.MkBV(65535, 32);
            Console.WriteLine(ctx.MkEq(a, b).Simplify());
        }
    }
}