
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
            Sort BV8   = ctx.MkBitVecSort(8);
            FuncDecl edge = ctx.MkFuncDecl("edge", new Sort[]{BV8, BV8}, B);
            FuncDecl path = ctx.MkFuncDecl("path", new Sort[]{BV8, BV8}, B);
            BitVecExpr x = (BitVecExpr)ctx.MkBound(0,BV8);
            BitVecExpr y = (BitVecExpr)ctx.MkBound(1,BV8);
            BitVecExpr z = (BitVecExpr)ctx.MkBound(2,BV8);
            s.RegisterRelation(edge);
            s.RegisterRelation(path);
            s.AddRule(ctx.MkImplies((BoolExpr)edge[x,y],(BoolExpr)path[x,y]));
            s.AddRule(ctx.MkImplies(ctx.MkAnd((BoolExpr)path[x,y],(BoolExpr)path[y,z]),
                                    (BoolExpr)path[x,z]));
            for (uint i = 0; i < 128; ++i) {
               s.AddFact(edge, i, i+1);
            }
            Console.WriteLine(s.Query((BoolExpr)path[ctx.MkBV(0,8),ctx.MkBV(129,8)]));
            Console.WriteLine(s.GetAnswer());
            Console.WriteLine(s.Query((BoolExpr)path[ctx.MkBV(0,8),ctx.MkBV(128,8)]));
            Console.WriteLine(s.GetAnswer());
            Console.WriteLine(s.Query((BoolExpr)path[x,ctx.MkBV(20,8)]));
            Console.WriteLine(s.GetAnswer());
            Console.WriteLine(s.Query(ctx.MkAnd((BoolExpr)path[x,y], 
                                                (BoolExpr)path[y,ctx.MkBV(20,8)])));
            Console.WriteLine(s.GetAnswer());
        }
    }

//    static void Main() { Test t = new Test(); t.Run(); }
}