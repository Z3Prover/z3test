
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

            Console.WriteLine("is expression: " + (x is Expr));

            Expr n = ctx.MkAdd(x, ctx.MkInt(1));

            Console.WriteLine("is application: " + (x.IsNumeral || x.IsExpr));

            Console.WriteLine("decl: " + n.FuncDecl);

            Console.WriteLine("num args: " + n.NumArgs);

            for (uint i = 0; i < n.NumArgs; i++)
                Console.WriteLine("arg(" + i + ") -> " + n.Args[i]);
        }
    }
}