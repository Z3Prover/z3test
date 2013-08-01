using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

using runlib;

namespace runsolver
{
    class Program
    {
        static void Usage()
        {
            Console.WriteLine("runsolver win32 (C) 2013 Microsoft Research");
            Console.WriteLine("Thanks to Olivier Roussel for the original runsolver tool for Linux.");
            Console.WriteLine("Usage: runsolver");
            Console.WriteLine("       [-C cpu-limit]");
            Console.WriteLine("       [-M mem-limit]");
            Console.WriteLine("       [-O output-limit]");
            Console.WriteLine("       command");
        }

        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                Usage();
                return;
            }

            bool verbose = false;
            ulong timeout = 0;
            ulong memout = 0;
            ulong outputlimit = 134217728 /* 128 MB */;

            uint i = 0;
            string binary = null;
            string[] binary_args = null;

            for (; i < args.Length; i++)
            {
                if (args[i].Equals("-C"))
                    if (args.Length == i + 1)
                    { Usage(); return; }
                    else
                        timeout = Convert.ToUInt64(args[++i]);
                else if (args[i].Equals("-M"))
                    if (args.Length == i + 1)
                    { Usage(); return; }
                    else
                        memout = Convert.ToUInt64(args[++i]) * 1024 * 1024;
                else if (args[i].Equals("-O"))
                    if (args.Length == i + 1)
                    { Usage(); return; }
                    else
                        outputlimit = Convert.ToUInt64(args[++i]);
                else
                    break;
            }

            binary = args[i++];
            binary_args = new string[args.Length - i];
            uint j = 0;
            while (i < args.Length)
                binary_args[j++] = args[i++];


            // Get absolute paths for everything.
            binary = Path.GetFullPath(binary);
            for (i = 0; i < binary_args.Length; i++)
            {
                if (File.Exists(args[i]))
                    binary_args[i] = Path.GetFullPath(binary_args[i]);
            }

            string old_wd = Directory.GetCurrentDirectory();

            string new_wd = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
            Directory.CreateDirectory(new_wd);
            Directory.SetCurrentDirectory(new_wd);

            if (verbose)
            {
                Console.WriteLine("Working directory: {0}", Directory.GetCurrentDirectory());
                Console.WriteLine("Binary: {0}", binary);
                Console.Write("Arguments:");
                for (i = 0; i < binary_args.Length; i++)
                    Console.Write(" {0}", binary_args[i]);
                Console.WriteLine();
            }

            Executor ex = new Executor(binary, binary_args, timeout, memout, outputlimit, 262144 /* 256 KB */);
            Result r = ex.Execute();
            Console.WriteLine(r);

            Directory.SetCurrentDirectory(old_wd);
            try { Directory.Delete(new_wd, true); }
            catch { }
        }
    }
}
