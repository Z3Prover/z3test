
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            Console.WriteLine("Simplify");
            Symbol[] sp = ctx.SimplifyParameterDescriptions.Names;
            foreach (var s in sp) {
                Console.WriteLine("{0}",s);
            }

            Console.WriteLine("Fixedpoint");
	    Fixedpoint fp = ctx.MkFixedpoint();
            sp = fp.ParameterDescriptions.Names;
            foreach (var s in sp) {
                Console.WriteLine("{0}",s);
            }

        }
    }
}