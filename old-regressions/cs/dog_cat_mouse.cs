
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
            IntExpr dog = ctx.MkIntConst("dog");
            IntExpr cat = ctx.MkIntConst("cat");
            IntExpr mouse = ctx.MkIntConst("mouse");

            Solver s = ctx.MkSolver();

            s.Assert(ctx.MkGe(dog, ctx.MkInt(1)));
            s.Assert(ctx.MkGe(cat, ctx.MkInt(1)));
            s.Assert(ctx.MkGe(mouse, ctx.MkInt(1)));
            s.Assert(ctx.MkEq(ctx.MkAdd(dog, cat, mouse), ctx.MkInt(100)));
            s.Assert(ctx.MkEq(ctx.MkAdd(ctx.MkMul(ctx.MkInt(1500), dog),
                                        ctx.MkMul(ctx.MkInt(100), cat),
                                        ctx.MkMul(ctx.MkInt(25), mouse)),
                              ctx.MkInt(10000)));

            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}