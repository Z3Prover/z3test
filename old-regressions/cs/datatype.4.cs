using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" },
            { "MODEL", "true" } };

        using (Context ctx = new Context(cfg))
        {
            EnumSort color = ctx.MkEnumSort("Color", new string[] { "red", "green", "blue" });

            Expr red = color.Consts[0];
            Expr green = color.Consts[1];
            Expr blue = color.Consts[2];

            Console.WriteLine(ctx.MkEq(green, blue));
            Console.WriteLine(ctx.MkEq(green, blue).Simplify());

            Expr c = ctx.MkConst("c", color);

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkNot(ctx.MkEq(c, green)));
            s.Assert(ctx.MkNot(ctx.MkEq(c, blue)));
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}