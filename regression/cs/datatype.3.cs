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
            Constructor cred = ctx.MkConstructor("red", "is_red");
            Constructor cgreen = ctx.MkConstructor("green", "is_green");
            Constructor cblue = ctx.MkConstructor("blue", "is_blue");

            DatatypeSort color = ctx.MkDatatypeSort("Color", new Constructor[] { cred, cgreen, cblue });

            Expr Red = ctx.MkConst(color.Constructors[0]);
            Expr Green = ctx.MkConst(color.Constructors[1]);
            Expr Blue = ctx.MkConst(color.Constructors[2]);

            Expr c = ctx.MkConst("c", color);

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkNot(ctx.MkOr(ctx.MkEq(c, Red), ctx.MkEq(c, Green), ctx.MkEq(c, Blue))));
            Console.WriteLine(s.Check()); // must be unsat

            BoolExpr c_is_red = (BoolExpr)color.Recognizers[0][c];
            BoolExpr c_is_green = (BoolExpr)color.Recognizers[1][c];
            BoolExpr c_is_blue = (BoolExpr)color.Recognizers[2][c];

            s = ctx.MkSolver();
            s.Assert(ctx.MkOr(c_is_red, c_is_green, c_is_blue));
            Console.WriteLine(s.Check()); // must be sat

            s = ctx.MkSolver();
            s.Assert(ctx.MkNot(ctx.MkOr(c_is_red, c_is_green, c_is_blue)));
            Console.WriteLine(s.Check()); // must be unsat
        }
    }
}