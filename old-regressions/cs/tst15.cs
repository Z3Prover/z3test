
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
            ArrayExpr a = ctx.MkArrayConst("a", ctx.IntSort, ctx.IntSort);
            FuncDecl f = ctx.MkFuncDecl("f", ctx.IntSort, ctx.IntSort);
            ArrayExpr m = ctx.MkMap(f, a);
            Console.WriteLine(m);
            Console.WriteLine(m.IsArrayMap);
            Console.WriteLine(a.IsArrayMap);
            Console.WriteLine(m.IsSelect);
            Console.WriteLine(ctx.MkSelect(m, ctx.MkInt(0)).IsSelect);
            Console.WriteLine(ctx.MkStore(m, ctx.MkInt(0), ctx.MkInt(1)).IsStore);
            Console.WriteLine(ctx.MkStore(m, ctx.MkInt(0), ctx.MkInt(1)));
            Console.WriteLine(m.IsStore);
            Console.WriteLine(m.FuncDecl);
            Console.WriteLine(m.FuncDecl.Parameters[0].FuncDecl);
            Console.WriteLine(m.FuncDecl.Parameters[0].FuncDecl[ctx.MkInt(0)]);
            Console.WriteLine(ctx.MkSelect(m, ctx.MkInt(10)));
        }
    }
}