
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
            { "PROOF_MODE", "2" } };

        using (Context ctx = new Context(cfg))
        {
            Solver s = ctx.MkSolver();

            try
            {                
                Expr p1 = s.Proof;
            }
            catch (Z3Exception ex)
            {
                Console.WriteLine("failed: " + ex.Message);
            }            
        }
    }
}