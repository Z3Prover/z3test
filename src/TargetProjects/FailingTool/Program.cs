using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FailingTool
{
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length != 1) throw new Exception("Incorrect number of arguments");

            if (args[0] == "out-of-memory")
            {
                const uint chunkSize = 64 << 20; // 64 MB
                List<byte[]> data = new List<byte[]>(1024);
                for (int i = 0; ; i++)
                {
                    Console.WriteLine("i = " + i + " / " + (GC.GetTotalMemory(true) >> 20) + " MB");
                    var bytes = new byte[chunkSize];
                    data.Add(bytes);
                }
            }

            return 0;
        }
    }
}
