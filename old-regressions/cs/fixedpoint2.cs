
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
            BoolSort B = ctx.BoolSort;
            Sort BV8     = ctx.MkBitVecSort(8);
            FuncDecl f = ctx.MkFuncDecl("f", BV8, B);
            FuncDecl g = ctx.MkFuncDecl("g", BV8, B);
            BitVecExpr b0 = (BitVecExpr)ctx.MkBound(0,BV8);
            s.RegisterRelation(f);
            s.RegisterRelation(g);
            s.AddRule((BoolExpr)f[b0]);
            BitVecExpr mask0 = ctx.MkBV(0xFE,8);
            BoolExpr even = ctx.MkEq(b0,ctx.MkBVAND(b0,mask0));
            s.AddRule(ctx.MkImplies(ctx.MkAnd((BoolExpr)f[b0],even), (BoolExpr)g[b0]));
            Console.WriteLine(s.Query((BoolExpr)g[b0]));
            Console.WriteLine(s.GetAnswer());
        }
    }
}