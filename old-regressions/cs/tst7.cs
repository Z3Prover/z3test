using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            BoolExpr p = ctx.MkBoolConst("p");
            BoolExpr q = ctx.MkBoolConst("q");
            Console.WriteLine(ctx.MkAnd(p, q));
            Console.WriteLine(ctx.MkOr(p, q));
            Console.WriteLine(ctx.MkAnd(p, ctx.MkTrue()));
            Console.WriteLine(ctx.MkOr(p, ctx.MkFalse()));
            Console.WriteLine(ctx.MkNot(p));
            Console.WriteLine(ctx.MkImplies(p, q));
            Console.WriteLine(ctx.MkEq(p, q).Simplify());
            Console.WriteLine(ctx.MkEq(p, q));

            BoolExpr r = ctx.MkBoolConst("r");

            Console.WriteLine(ctx.MkNot(ctx.MkEq(p, ctx.MkNot(ctx.MkEq(q, r)))));
            Console.WriteLine(ctx.MkNot(ctx.MkEq(ctx.MkNot(ctx.MkEq(p, q)), r)));
            Console.WriteLine(ctx.MkEq(p, ctx.MkTrue()));
            Console.WriteLine(ctx.MkEq(p, ctx.MkFalse()));
            Console.WriteLine(ctx.MkEq(p, ctx.MkTrue()).Simplify());
            Console.WriteLine(ctx.MkEq(p, ctx.MkFalse()).Simplify());
            Console.WriteLine(ctx.MkEq(p, p).Simplify());
            Console.WriteLine(ctx.MkEq(p, q).Simplify());
            Console.WriteLine(ctx.MkAnd(p, q, r));
            Console.WriteLine(ctx.MkOr(p, q, r));

            IntExpr x = ctx.MkIntConst("x");

            Console.WriteLine(x is BoolExpr);
            Console.WriteLine(p is BoolExpr);
            Console.WriteLine(ctx.MkAnd(p, q) is BoolExpr);
            Console.WriteLine(p is BoolExpr);
            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt(1)) is BoolExpr);
            Console.WriteLine(p.IsAnd);
            Console.WriteLine(ctx.MkOr(p, q).IsOr);
            Console.WriteLine(ctx.MkAnd(p, q).IsAnd);
            Console.WriteLine(x.IsNot);
            Console.WriteLine(p.IsNot);
            Console.WriteLine(ctx.MkNot(p));
            Console.WriteLine(ctx.MkNot(p).IsDistinct);
            Console.WriteLine(ctx.MkEq(p, q).IsDistinct);
            Console.WriteLine(ctx.MkDistinct(p, q).IsDistinct);
            Console.WriteLine(ctx.MkDistinct(x, ctx.MkAdd(x, ctx.MkInt(1)), ctx.MkAdd(x, ctx.MkInt(2))).IsDistinct);

            Console.WriteLine();

            Console.WriteLine(ctx.MkBool(true));
            Console.WriteLine(ctx.MkBool(false));
            Console.WriteLine(ctx.BoolSort);

            Context ctx1 = new Context();
            Console.WriteLine(ctx1.MkBool(true));
            Console.WriteLine(ctx1.BoolSort);
            Console.WriteLine(ctx1.MkBool(true).Sort == ctx1.BoolSort);
            Console.WriteLine(ctx1.MkBool(true).Sort == ctx.BoolSort);
            Console.WriteLine(ctx1.MkBool(true).Sort != ctx.BoolSort);
        }
    }
}