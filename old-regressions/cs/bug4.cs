
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

        Context ctx = new Context(cfg);

        RealExpr x = ctx.MkRealConst("x");
        RealExpr y = ctx.MkRealConst("y");

        Console.WriteLine(ctx.MkPower(ctx.MkAdd(x, y), ctx.MkReal(3)));

        Console.WriteLine(ctx.MkPower(x, ctx.MkAdd(y, ctx.MkReal(3))));
    }
}