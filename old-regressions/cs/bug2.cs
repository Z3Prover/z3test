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

        BitVecExpr b = ctx.MkBVConst("b", 16);

        Console.WriteLine(ctx.MkExtract(12, 2, b));
        Console.WriteLine(ctx.MkSignExt(10, b));
        Console.WriteLine(ctx.MkZeroExt(10, b));
        Console.WriteLine(ctx.MkRepeat(3, b));
    }
}