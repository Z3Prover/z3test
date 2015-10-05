
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
            Solver s = ctx.MkSolver();
            try
            {
                s.Pop();
            }
            catch (Z3Exception ex)
            {
                Console.WriteLine("Pop failed: " + ex.Message);
            }
        }

        Console.WriteLine("done");
    }
}