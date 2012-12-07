using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public class Edge
    {
        public uint v0, v1;
        public Edge(uint x, uint y) { v0 = x; v1 = y; }
    }

    protected void Clique(Context ctx, Edge[] edges, uint n)
    {
        uint num = 0;
        foreach (Edge e in edges)
        {
            if (e.v0 >= num)
                num = e.v0 + 1;
            if (e.v1 >= num)
                num = e.v1 + 1;
        }

        Solver S = ctx.MkSolver();

        IntExpr [] In = new IntExpr[num];

        for (uint i = 0; i < num; i++)
        {
            In[i] = ctx.MkIntConst(String.Format("in_{0}", i));
            S.Assert(ctx.MkLe(ctx.MkInt(0), In[i]));
            S.Assert(ctx.MkLe(In[i], ctx.MkInt(1)));
        }

        ArithExpr sum = ctx.MkInt(0);
        foreach (IntExpr e in In)
            sum = ctx.MkAdd(sum, e);
        S.Assert(ctx.MkGe(sum, ctx.MkInt(n)));
        
        IntNum[][] matrix = new IntNum[num][];

        for (uint i = 0; i < num; i++)
        {
            matrix[i] = new IntNum[i];
            for (uint j = 0; j < i; j++)
                matrix[i][j] = ctx.MkInt(0);
        }

        foreach (Edge e in edges)
        {
            uint s = e.v0;
            uint t = e.v1;
            if (s < t) {
                s = e.v1;
                t = e.v0;
            }
            matrix[s][t] = ctx.MkInt(1);
        }

        for (uint i = 0; i < num; i++)
            for (uint j = 0; j < i; j++)
                if (i != j)
                    if (matrix[i][j].Int == 0)
                        S.Assert(ctx.MkOr(ctx.MkEq(In[i], ctx.MkInt(0)), 
                                          ctx.MkEq(In[j], ctx.MkInt(0))));

        Status r = S.Check();
        if (r == Status.UNSATISFIABLE)
            Console.WriteLine("no solution");
        else if (r == Status.UNKNOWN)
        {
            Console.Write("failed");
            Console.WriteLine(S.ReasonUnknown);
        }
        else
        {
            Console.WriteLine("solution found");
            Model m = S.Model;
            
            Console.Write("{ ");
            foreach (FuncDecl cfd in m.ConstDecls)
            {
                IntNum q = (IntNum)m.ConstInterp(cfd);
                if (q.Int == 1)
                    Console.Write(" " + cfd.Name);
            }
            Console.WriteLine(" }");

            Console.Write("{ ");
            for (uint i = 0; i < num; i++)
            {
                IntNum q = (IntNum)m.Evaluate(In[i]);                
                if (q.Int == 1)
                    Console.Write(" " + In[i]);
            }
            Console.WriteLine(" }");
        }

    }

    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" } };

        using (Context ctx = new Context(cfg))
        {
            Edge[] g = { new Edge(0, 1), new Edge(2, 3), new Edge(1, 2), new Edge(2, 3), new Edge(1, 4), new Edge(1, 5), new Edge(2, 5) };

            Clique(ctx, g, 3);
            Clique(ctx, g, 4);
        }
    }
}