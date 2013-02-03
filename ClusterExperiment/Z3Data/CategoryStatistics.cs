using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Z3Data
{
    public class CategoryStatistics
    {
        public uint Files = 0;
        public uint SAT = 0, UNSAT = 0, UNKNOWN = 0, Errors = 0, Bugs = 0, Memout = 0, Timeout = 0;
        public double TimeSAT = 0.0, TimeUNSAT = 0.0;
        public uint Overperformers = 0, UnderPerformers = 0;

        public void Clear()
        {
            Files = 0;
            SAT = 0;
            UNSAT = 0;
            UNKNOWN = 0;
            Overperformers = 0;
            UnderPerformers = 0;
            Errors = 0;
            Bugs = 0;
            Memout = 0;
            Timeout = 0;
            TimeSAT = 0.0;
            TimeUNSAT = 0.0;
            Overperformers = 0;
            UnderPerformers = 0;
        }

        public void Add(CategoryStatistics o)
        {
            Files += o.Files;
            SAT += o.SAT;
            UNSAT += o.UNSAT;
            UNKNOWN += o.UNKNOWN;
            Errors += o.Errors;
            Bugs += o.Bugs;
            Memout += o.Memout;
            Timeout += o.Timeout;
            TimeSAT += o.TimeSAT;
            TimeUNSAT += o.TimeUNSAT;
            Overperformers += o.Overperformers;
            UnderPerformers += o.UnderPerformers;
        }
    }
}
