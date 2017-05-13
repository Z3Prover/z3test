using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delay
{
    class Program
    {
        static int Main(string[] args)
        {
            if(args.Length != 1)
            {
                Console.WriteLine("Use: Delay.exe <delay in ms>");
                return 42;
            }

            int ms = int.Parse(args[0]);
            Console.Write("Starting delay for {0} ms...", ms);
            System.Threading.Thread.Sleep(ms);
            Console.WriteLine("Done.");

            Console.Error.WriteLine("Sample error text.");
            return 0;
        }
    }
}
