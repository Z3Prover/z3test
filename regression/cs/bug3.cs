using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" } };

        Context ctx = new Context(cfg);

        BitVecNum b = ctx.MkBV(0xbadc0de, 32);

        Console.WriteLine(b.SExpr());
        Console.WriteLine(b);
        Console.WriteLine(b.Int64);
    }
}