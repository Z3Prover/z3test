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

            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt(1)).GetHashCode() == ctx.MkAdd(ctx.MkInt(1), x).GetHashCode());
            Console.WriteLine(x.Sort.GetHashCode() == ctx.IntSort.GetHashCode());
        }
    }
}