using System;
using System.Text;
using System.IO;

namespace runlib
{
    public class Result
    {
        const int INIT_BUF = 16777216;

        public MemoryStream stdout = new MemoryStream(INIT_BUF);
        public MemoryStream stderr = new MemoryStream(INIT_BUF);
        public string status = "OK";
        public int return_value = 0;
        public double runtime = 0.0;

        public override string ToString()
        {
            stdout.Seek(0, SeekOrigin.Begin);
            stderr.Seek(0, SeekOrigin.Begin);
            string res = "Status: " + status + "\nReturn value: " + return_value + "\nTime: " + runtime.ToString() + "\n";
            res += "STDOUT\n" + new StreamReader(stdout).ReadToEnd() + "\n";
            res += "STDERR\n" + new StreamReader(stderr).ReadToEnd() + "\n";        
            return res;
        }
    }
}
