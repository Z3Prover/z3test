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

            Solver s = ctx.MkSolver();
            Console.WriteLine(s);

            s.Assert(ctx.MkGt(x, ctx.MkInt(10)), ctx.MkEq(y, ctx.MkAdd(x, ctx.MkInt(2))));
            Console.WriteLine(s);
            Console.WriteLine("solving s");
            Console.WriteLine(s.Check());

            Console.WriteLine("creating new scope");
            s.Push();
            s.Assert(ctx.MkLt(y, ctx.MkInt(11)));
            Console.WriteLine(s);
            Console.WriteLine("solving updated constraints");
            Console.WriteLine(s.Check());

            Console.WriteLine("restoring");
            s.Pop();
            Console.WriteLine(s);
            Console.WriteLine("solving restored constraints");
            Console.WriteLine(s.Check());
        }
    }
}