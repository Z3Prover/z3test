
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
            Constructor c_leaf = ctx.MkConstructor("leaf", "is_leaf", new string[] { "val" }, new Sort[] { ctx.IntSort });
            Constructor c_node = ctx.MkConstructor("node", "is_node", new string[] { "left", "right" }, new Sort[] { null, null }, new uint[] { 1, 1 });
            Constructor[] constr_1 = new Constructor[] { c_leaf, c_node };

            Constructor c_nil = ctx.MkConstructor("nil", "is_nil");
            Constructor c_cons = ctx.MkConstructor("cons", "is_cons", new string[] { "car", "cdr" }, new Sort[] { null, null }, new uint[] { 0, 1 });
            Constructor[] constr_2 = new Constructor[] { c_nil, c_cons };                        
            
            DatatypeSort[] ts = ctx.MkDatatypeSorts(new string[] { "Tree", "TreeList" }, 
                                                    new Constructor[][] { constr_1, constr_2 });

            DatatypeSort Tree = ts[0];
            DatatypeSort TreeList = ts[1];

            FuncDecl leaf = Tree.Constructors[0];
            FuncDecl node = Tree.Constructors[1];
            FuncDecl val = Tree.Accessors[0][0];

            FuncDecl nil = TreeList.Constructors[0];
            FuncDecl cons = TreeList.Constructors[1];

            Expr t1 = leaf[ctx.MkInt(10)];
            Expr tl1 = cons[t1, nil.Apply()];
            Expr t2 = node[tl1, nil.Apply()];

            Console.WriteLine(t2);
            Console.WriteLine(val.Apply(t1).Simplify());

            t1 = ctx.MkConst("t1", TreeList);
            t2 = ctx.MkConst("t2", TreeList);
            Expr t3 = ctx.MkConst("t3", TreeList);

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkDistinct(t1, t2, t3));
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}