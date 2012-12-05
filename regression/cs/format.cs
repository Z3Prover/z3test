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
            IntExpr[] x = new IntExpr[20];
            IntExpr[] y = new IntExpr[20];

            for (uint i = 0; i < 20; i++)
            {
                x[i] = ctx.MkIntConst(string.Format("x_{0}", i));
                y[i] = ctx.MkIntConst(string.Format("y_{0}", i));
            }

            BoolExpr f = ctx.MkAnd(ctx.MkGe(ctx.MkAdd(x), ctx.MkInt(0)),
                                   ctx.MkGe(ctx.MkAdd(y), ctx.MkInt(0)));

            Console.WriteLine("now: " + ctx.GetParamValue("PP_MAX_DEPTH"));

            ctx.UpdateParamValue("PP_MAX_DEPTH", "1");
            Console.WriteLine(f);

            ctx.UpdateParamValue("PP_MAX_DEPTH", "100");
            ctx.UpdateParamValue("PP_MAX_NUM_LINES", "10");
            Console.WriteLine(f);

            ctx.UpdateParamValue("PP_MAX_NUM_LINES", "20");
            ctx.UpdateParamValue("PP_MAX_WIDTH", "300");
            Console.WriteLine(f);

            Console.WriteLine("now: " + ctx.GetParamValue("PP_MAX_WIDTH"));
        }
    }
}