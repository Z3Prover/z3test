
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
            FuncDecl x_d = x.FuncDecl;

            Console.WriteLine("is_expr(x_d): " + x_d.IsExpr);
            Console.WriteLine("is_func_decl(x_d): " + x_d.IsFuncDecl);
            Console.WriteLine("x_d.Name: " + x_d.Name);
            Console.WriteLine("x_d.Range: " + x_d.Range);
            Console.WriteLine("x_d.Arity: " + x_d.Arity);
            Console.WriteLine("x_d() == x: " + (x_d.Apply() == x));
            
            FuncDecl f = ctx.MkFuncDecl("f", new Sort[] { ctx.IntSort, ctx.RealSort }, ctx.BoolSort);

            Console.WriteLine("f.Name: " + f.Name);
            Console.WriteLine("f.Range: " + f.Range);
            Console.WriteLine("f.Arity: " + f.Arity);

            for (uint i = 0; i < f.Arity; i++)
                Console.WriteLine("domain(" + i + "): " + f.Domain[i]);
            
            Console.WriteLine(f[x, ctx.MkInt2Real(x)]);
            Console.WriteLine(f[x, ctx.MkInt2Real(x)].FuncDecl == f);
        }
    }
}