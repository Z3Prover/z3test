
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            RealExpr x = ctx.MkRealConst("x");
            RealExpr y = ctx.MkRealConst("y");
            RealExpr z = ctx.MkRealConst("z");

            IntExpr a = ctx.MkIntConst("a");
            IntExpr b = ctx.MkIntConst("b");
            IntExpr c = ctx.MkIntConst("c");

            ctx.UpdateParamValue(":pp-flat-assoc", "false");

            Console.WriteLine(ctx.MkAdd(x, y, ctx.MkInt2Real(a)));
            Console.WriteLine(ctx.MkAdd(x, ctx.MkReal(1)));
            Console.WriteLine(ctx.MkAdd(ctx.MkReal(2), y));
            Console.WriteLine(ctx.MkMul(x, y));
            Console.WriteLine(ctx.MkAdd(ctx.MkInt(2), ctx.MkInt(3)));
            Console.WriteLine(ctx.MkMul(ctx.MkReal(2), x));
            Console.WriteLine(ctx.MkAdd(ctx.MkInt2Real((IntExpr)ctx.MkAdd(ctx.MkInt(2), ctx.MkInt(3))), x));
            Console.WriteLine(ctx.MkAdd((RealExpr)ctx.MkInt2Real((IntExpr)ctx.MkAdd(ctx.MkInt(2), ctx.MkInt(3))).Simplify(), x));
            Console.WriteLine(ctx.MkAdd(a, b, ctx.MkInt(1)));
            Console.WriteLine(ctx.MkDiv(x, y));
            Console.WriteLine(ctx.MkDiv(x, ctx.MkReal(2)));
            Console.WriteLine(ctx.MkDiv(ctx.MkReal(2), y));
            Console.WriteLine(ctx.MkDiv(a, ctx.MkInt(2)));
            Console.WriteLine(ctx.MkDiv(ctx.MkAdd(a, b), ctx.MkInt(2)));
            Console.WriteLine(ctx.MkDiv(ctx.MkInt(3), a));
            Console.WriteLine(ctx.MkMod(a, b));
            Console.WriteLine(ctx.MkMod(a, ctx.MkInt(2)));
            Console.WriteLine(ctx.MkMod(ctx.MkInt(3), a));
            Console.WriteLine(ctx.MkSub(a, ctx.MkInt(2)));
            Console.WriteLine(ctx.MkUnaryMinus(a));
            Console.WriteLine(ctx.MkUnaryMinus(x));
            Console.WriteLine(ctx.MkSub(a, b));

            Console.WriteLine(a.IsAdd);
            Console.WriteLine(ctx.MkAdd(a, b).IsAdd);
            Console.WriteLine(ctx.MkSub(a, b).IsAdd);
            Console.WriteLine(ctx.MkInt(10).IsAdd);
            Console.WriteLine(ctx.MkMul(a, b).IsMul);
            Console.WriteLine(ctx.MkMul(x, ctx.MkInt2Real(b)).IsMul);
            Console.WriteLine(ctx.MkAdd(a, b).IsMul);
            Console.WriteLine(ctx.MkDiv(a, ctx.MkInt(2)).IsDiv);
            Console.WriteLine(ctx.MkDiv(ctx.MkReal(3), x).IsDiv);
            Console.WriteLine(ctx.MkDiv(x,y).IsDiv);
            Console.WriteLine(ctx.MkDiv(a, ctx.MkInt(2)).IsIDiv);
            Console.WriteLine(ctx.MkAdd(ctx.MkInt(2), ctx.MkInt(3)).Simplify().IsAdd);

            Console.WriteLine();
            Console.WriteLine(a is ArithExpr);
            Console.WriteLine(ctx.MkInt(2) is ArithExpr);
            Console.WriteLine(ctx.MkAdd(a, b) is ArithExpr);
            Console.WriteLine(ctx.MkBoolConst("p") is ArithExpr);
            Console.WriteLine(ctx.MkInt(2) is IntNum);
            Console.WriteLine(ctx.MkInt(2) is RatNum);
            Console.WriteLine(ctx.MkReal(2, 3));
            Console.WriteLine(ctx.MkReal(2, 3).IsReal);
            Console.WriteLine(ctx.MkReal(2, 3) is ArithExpr);
            Console.WriteLine(ctx.MkReal(2, 3).IsConst);
            Console.WriteLine(ctx.MkReal(2, 3).Simplify() is RatNum);
            Console.WriteLine(ctx.MkReal(2, 3).Simplify().IsRatNum);
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)).Simplify().IsAlgebraicNumber);
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)).Simplify() is AlgebraicNum);
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)).IsAlgebraicNumber);
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)) is AlgebraicNum);
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)));
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 3)));
        }
    }
}
