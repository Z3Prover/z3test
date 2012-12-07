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
            try
            {
                Expr n = ctx.MkReal("1/0");
                Console.WriteLine(n);
            }
            catch (Z3Exception ex)
            {
                Console.WriteLine("failed: " + ex.Message);
            }

            Console.WriteLine("done");
        }
    }
}