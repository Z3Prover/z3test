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
            ListSort L = ctx.MkListSort("List", ctx.IntSort);

            FuncDecl cons = L.ConsDecl;
            FuncDecl car = L.HeadDecl;
            FuncDecl cdr = L.TailDecl;
            Expr nil = L.Nil;

            Expr l1 = cons[ctx.MkInt(10), cons[ctx.MkInt(20), nil]];
            Console.WriteLine(l1);
            Console.WriteLine(cdr[l1].Simplify());
            Console.WriteLine(car[l1].Simplify());
            Console.WriteLine(ctx.MkEq(l1, nil).Simplify());
        }
    }
}