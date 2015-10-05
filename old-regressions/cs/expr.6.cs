
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
            IntExpr y = ctx.MkIntConst("y");

            Console.WriteLine(ctx.MkAdd(x, y).FuncDecl.DeclKind == Z3_decl_kind.Z3_OP_ADD);
            Console.WriteLine(ctx.MkAdd(x, y).FuncDecl.DeclKind == Z3_decl_kind.Z3_OP_SUB);
        }
    }
}