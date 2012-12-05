using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" } };

        Context ctx = new Context(cfg);

        RealExpr x = ctx.MkRealConst("x");
        RealExpr y = ctx.MkRealConst("y");
        RealExpr z = ctx.MkRealConst("z");

        RatNum two = ctx.MkReal(2);

        Console.WriteLine(ctx.MkAdd(ctx.MkSub(ctx.MkMul(x, y), ctx.MkPower(y, two)), ctx.MkPower(z, two)));

        Console.WriteLine(ctx.MkSub(ctx.MkAdd(ctx.MkMul(x, y), ctx.MkPower(y, two)), ctx.MkPower(z, two)));

        Console.WriteLine(ctx.MkMul(ctx.MkAdd(x, y), z));
    }
}