
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
            RealExpr y = ctx.MkRealConst("y");
            Console.WriteLine((ctx.MkAdd(x, ctx.MkInt(1))).Sort);
            Console.WriteLine((ctx.MkAdd(y, ctx.MkReal(1))).Sort);
            Console.WriteLine((ctx.MkGe(x, ctx.MkInt(2))).Sort);
        }
    }
}