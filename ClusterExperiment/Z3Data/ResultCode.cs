using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Z3Data
{
    public static class ResultCode
    {
        public const int OK = 0;
        public const int BUG = 3;
        public const int ERROR = 4;
        public const int TIME = 5;
        public const int MEMORY = 6;

        public static bool IsOK(uint rc) { return rc == OK; }
        public static bool IsBug(uint rc) { return rc == BUG; }
        public static bool IsError(uint rc) { return rc == ERROR; }
        public static bool IsTime(uint rc) { return rc == TIME; }
        public static bool IsMemory(uint rc) { return rc == MEMORY; }        
    }
}
