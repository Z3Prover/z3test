
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
            { "AUTO_CONFIG", "true" },
            { "MODEL", "true" } };

        using (Context ctx = new Context(cfg))
        {
            ListSort IntList = ctx.MkListSort("List_of_Int", ctx.IntSort);
            ListSort RealList = ctx.MkListSort("List_of_Real", ctx.RealSort);
            ListSort IntListList = ctx.MkListSort("List_of_IntList", IntList);

            Expr l1 = IntList.ConsDecl[ctx.MkInt(10), IntList.Nil];

            Console.WriteLine(l1);
            Console.WriteLine(IntListList.ConsDecl[l1, IntListList.ConsDecl[l1, IntListList.Nil]]);
            Console.WriteLine(RealList.ConsDecl[ctx.MkReal("1/3"), RealList.Nil]);

            Console.WriteLine(l1.Sort);
        }
    }
}