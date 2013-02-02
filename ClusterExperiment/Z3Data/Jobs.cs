using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Z3Data
{
    public class Jobs : SortedSet<Job>
    {
        public Jobs(string dataDir, bool onlyFinished = false)
        {
            foreach (string file in Directory.EnumerateFiles(dataDir, "*.csv"))
            {
                if (!file.Contains("_"))
                {
                    uint id = Convert.ToUInt32(file.Substring(dataDir.Length, file.IndexOf('.') - dataDir.Length));
                    Job j = new Job(dataDir, id);
                    if (!onlyFinished || j.MetaData.isFinished)
                        Add(j);
                }
            }
        }
    }
}
