
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
            Solver s = ctx.MkSolver();
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }

        cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "false" },
            { "MODEL", "true" } };

        using (Context ctx = new Context(cfg))
        {
            Solver s = ctx.MkSolver();
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}