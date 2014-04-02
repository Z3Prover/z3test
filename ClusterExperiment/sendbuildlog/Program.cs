using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Z3Data;

namespace sendbuildlog
{
    class Program
    {
        static void Main(string[] args)
        {
            Configuration c = new Configuration("config.xml");
            
            Sendmail.Send(c.developers,
                          "Build failed at Windows (x86/x64)", 
                          "The build failed; please check the attached logfile for errors.", 
                          c.z3_drop_dir + "\\build.log");
        }
    }
}
