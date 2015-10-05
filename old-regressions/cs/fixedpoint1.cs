
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context()) {
            var s = ctx.MkFixedpoint();
            BoolExpr a = ctx.MkBoolConst("a");
            BoolExpr b = ctx.MkBoolConst("b");
            BoolExpr c = ctx.MkBoolConst("c");            
            s.RegisterRelation(a.FuncDecl);
            s.RegisterRelation(b.FuncDecl);
            s.RegisterRelation(c.FuncDecl);
            s.AddRule(ctx.MkImplies(a, b));
            s.AddRule(ctx.MkImplies(b, c));
            Console.WriteLine(s.Query(c));
            s.AddRule(a);
            Console.WriteLine(s.Query(c));
        }
    }
}