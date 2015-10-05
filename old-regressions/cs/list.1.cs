
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
            ArithExpr[] a = new ArithExpr[5];
            for (uint x = 0; x < 5; x++)
                a[x] = ctx.MkInt(x+1);

            foreach (Expr e in a)
                Console.WriteLine(e);

            ArithExpr[] X = new ArithExpr[5];
            for (uint i = 0; i < 5; i++)
                X[i] = ctx.MkIntConst(string.Format("x{0}", i));

            ArithExpr[] Y = new ArithExpr[5];
            for (uint i = 0; i < 5; i++)
                Y[i] = ctx.MkIntConst(string.Format("y{0}", i));

            foreach (Expr e in X)
                Console.WriteLine(e);

            ArithExpr[] X_plus_Y = new ArithExpr[5];
            for (uint i = 0; i < 5; i++)
                X_plus_Y[i] = ctx.MkAdd(X[i], Y[i]);

            foreach (Expr e in X_plus_Y)
                Console.WriteLine(e);

            BoolExpr[] X_gt_Y = new BoolExpr[5];
            for (uint i = 0; i < 5; i++)
                X_gt_Y[i] = ctx.MkGt(X[i], Y[i]);

            foreach (Expr e in X_gt_Y)
                Console.WriteLine(e);

            Console.WriteLine(ctx.MkAnd(X_gt_Y));

            Expr[][] matrix = new Expr[3][];
            for (uint i = 0; i < 3; i++) {
                matrix[i] = new Expr[3];
                for (uint j = 0; j < 3; j++)
                    matrix[i][j] = ctx.MkIntConst(string.Format("x_{0}_{1}", i + 1, j + 1));
            }

            foreach(Expr[] row in matrix) {
                foreach(Expr e in row)
                    Console.Write(" " + e);
                Console.WriteLine();
            }
        }
    }
}