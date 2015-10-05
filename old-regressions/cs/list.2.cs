
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
            IntExpr[] X = new IntExpr[5];
            for (uint i = 0; i < 5; i++)
                X[i] = ctx.MkIntConst(string.Format("x_{0}", i));

            RealExpr[] Y = new RealExpr[5];
            for (uint i = 0; i < 5; i++)
                Y[i] = ctx.MkRealConst(string.Format("y_{0}", i));

            BoolExpr[] P = new BoolExpr[5];
            for (uint i = 0; i < 5; i++)
                P[i] = ctx.MkBoolConst(string.Format("p_{0}", i));

            foreach (Expr x in X)
                Console.WriteLine(x);
            foreach (Expr x in Y)
                Console.WriteLine(x);
            foreach (Expr x in P)
                Console.WriteLine(x);

            foreach (ArithExpr y in Y)
                Console.WriteLine(ctx.MkPower(y, ctx.MkReal(2)));

            ArithExpr[] Yp = new ArithExpr[Y.Length];
            for (uint i = 0; i < Y.Length; i++)
                Yp[i] = ctx.MkPower(Y[i], ctx.MkReal(2));
            Console.WriteLine(ctx.MkAdd(Yp));
        }
    }
}