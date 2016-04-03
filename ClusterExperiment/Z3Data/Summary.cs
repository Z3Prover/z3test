using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Data;
using System.Data.OleDb;
using System.Diagnostics;

namespace Z3Data
{
    public class Summary : Dictionary<string, CategoryStatistics>
    {
        string _filename = "";
        CategoryStatistics _overall = null;

        public Summary(string dataDir, Job j)
        {
            _filename = dataDir + @"\" + j.MetaData.Id.ToString() + "_summary.csv";

            if (!File.Exists(_filename) ||
                (File.GetLastWriteTime(_filename) < j.MetaData.LastDataModification))
                Rebuild(j);

            Load();
        }

        private void Load()
        {
            _overall = null;
            Clear();

            using (FileStream fs = File.Open(_filename, FileMode.Open, FileAccess.Read, FileShare.Read))
            using (StreamReader f = new StreamReader(fs))
            {
                while (!f.EndOfStream)
                {
                    string s = f.ReadLine();
                    string[] tokens = s.Split(',');

                    if (tokens.Count() == 1 && tokens[0] == "") // empty line
                        continue;

                    if (tokens.Count() < 13 || tokens.Count() > 14)
                        throw new Exception("Unexpected number of tokens in summary line (" + _filename + ").");

                    if (!ContainsKey(tokens[0]))
                        Add(tokens[0], new CategoryStatistics());

                    base[tokens[0]].Files = Convert.ToUInt32(tokens[1]);
                    base[tokens[0]].SAT = Convert.ToUInt32(tokens[2]);
                    base[tokens[0]].UNSAT = Convert.ToUInt32(tokens[3]);
                    base[tokens[0]].UNKNOWN = Convert.ToUInt32(tokens[4]);
                    base[tokens[0]].Errors = Convert.ToUInt32(tokens[5]);
                    base[tokens[0]].Bugs = Convert.ToUInt32(tokens[6]);
                    base[tokens[0]].Memout = Convert.ToUInt32(tokens[7]);
                    base[tokens[0]].Timeout = Convert.ToUInt32(tokens[8]);

                    base[tokens[0]].TimeSAT = Convert.ToDouble(tokens[9]);
                    base[tokens[0]].TimeUNSAT = Convert.ToDouble(tokens[10]);

                    base[tokens[0]].Overperformers = Convert.ToUInt32(tokens[11]);
                    base[tokens[0]].UnderPerformers = Convert.ToUInt32(tokens[12]);

                    if (tokens.Count() > 13)
                        base[tokens[0]].InfrastructureErrors = Convert.ToUInt32(tokens[13]);
                }
            }
        }

        public void Save()
        {
            using (FileStream fs = File.Open(_filename, FileMode.Create))
            using (StreamWriter f = new StreamWriter(fs))
            using (Summary.Enumerator e = GetEnumerator())
            {
                while (e.MoveNext())
                {
                    CategoryStatistics s = e.Current.Value;
                    f.Write(e.Current.Key + ",");
                    f.Write(s.Files.ToString() + ",");
                    f.Write(s.SAT.ToString() + ",");
                    f.Write(s.UNSAT.ToString() + ",");
                    f.Write(s.UNKNOWN.ToString() + ",");
                    f.Write(s.Errors.ToString() + ",");
                    f.Write(s.Bugs.ToString() + ",");
                    f.Write(s.Memout.ToString() + ",");
                    f.Write(s.Timeout.ToString() + ",");
                    f.Write(s.TimeSAT.ToString() + ",");
                    f.Write(s.TimeUNSAT.ToString() + ",");
                    f.Write(s.Overperformers.ToString() + ",");
                    f.Write(s.UnderPerformers.ToString() + ",");
                    f.Write(s.InfrastructureErrors.ToString());
                    f.WriteLine();
                }
            }
        }

        public CategoryStatistics Overall
        {
            get
            {
                if (_overall == null)
                {
                    _overall = new CategoryStatistics();
                    foreach (KeyValuePair<string, CategoryStatistics> kvp in this)
                        _overall.Add(kvp.Value);
                }
                return _overall;
            }
        }

        public HashSet<string> Categories
        {
            get
            {
                HashSet<string> res = new HashSet<string>();
                foreach (KeyValuePair<string, CategoryStatistics> kvp in this)
                {
                    if (!res.Contains(kvp.Key))
                        res.Add(kvp.Key);
                }
                return res;
            }
        }

        public void Rebuild(Job j)
        {
            Stopwatch sw = new Stopwatch();
            sw.Restart();

            this.Clear();
            HashSet<string> seen = new HashSet<string>();
            uint duplicates = 0;
            foreach (CSVRow r in j.Rows)
                if (!ParseRow(r, seen)) duplicates++;
            if (duplicates != 0)
                Global.Say(duplicates.ToString() + " duplicates in #" + j.MetaData.Id);
            Save();

            Global.Say("Rebuilt summary for #" + j.MetaData.Id + " in " + (sw.Elapsed.TotalSeconds) + " sec.");
        }

        protected bool ParseRow(CSVRow r, HashSet<string> seen)
        {
            string category = r.Filename.Substring(0, r.Filename.IndexOf(@"\"));

            if (category == "")
                throw new Exception("Empty category string in `" + r.Filename + "'");

            if (!ContainsKey(category))
                Add(category, new CategoryStatistics());

            if (seen.Contains(r.Filename))
            {
                // Global.Say("Duplicate: " + r.Filename);
                return false;
            }
            else
                seen.Add(r.Filename);

            CategoryStatistics cs = this[category];

            switch (r.ResultCode)
            {
                case ResultCode.OK:
                    {
                        cs.SAT += r.SAT;
                        cs.UNSAT += r.UNSAT;
                        cs.UNKNOWN += r.UNKNOWN;
                        if (r.SAT > 0) cs.TimeSAT += r.Runtime;
                        if (r.UNSAT > 0) cs.TimeUNSAT += r.Runtime;
                        if ((r.SAT + r.UNSAT) > (r.TargetSAT + r.TargetUNSAT) && (r.UNKNOWN < r.TargetUNKNOWN))
                            cs.Overperformers++;
                        if ((r.SAT + r.UNSAT) < (r.TargetSAT + r.TargetUNSAT) || (r.UNKNOWN > r.TargetUNKNOWN))
                            cs.UnderPerformers++;
                        break;
                    }
                case ResultCode.BUG: cs.Bugs++; break;
                case ResultCode.ERROR:
                    {
                        if (r.StdErr.StartsWith("INFRASTRUCTURE ERROR:"))
                            cs.InfrastructureErrors++;
                        else
                            cs.Errors++;
                        cs.SAT += r.SAT;
                        cs.UNSAT += r.UNSAT;
                        cs.UNKNOWN += r.UNKNOWN;
                        if (r.SAT > 0) cs.TimeSAT += r.Runtime;
                        if (r.UNSAT > 0) cs.TimeUNSAT += r.Runtime;

                        if ((r.SAT + r.UNSAT) < (r.TargetSAT + r.TargetUNSAT) || (r.UNKNOWN > r.TargetUNKNOWN))
                            cs.UnderPerformers++;
                        break;
                    }
                case ResultCode.TIME:
                    {
                        cs.Timeout++;
                        cs.SAT += r.SAT;
                        cs.UNSAT += r.UNSAT;
                        cs.UNKNOWN += r.UNKNOWN;
                        if (r.SAT > 0) cs.TimeSAT += r.Runtime;
                        if (r.UNSAT > 0) cs.TimeUNSAT += r.Runtime;

                        if ((r.SAT + r.UNSAT) < (r.TargetSAT + r.TargetUNSAT) || (r.UNKNOWN > r.TargetUNKNOWN))
                            cs.UnderPerformers++;
                        break;
                    }
                case ResultCode.MEMORY:
                    {
                        cs.Memout++;
                        cs.SAT += r.SAT;
                        cs.UNSAT += r.UNSAT;
                        cs.UNKNOWN += r.UNKNOWN;
                        if (r.SAT > 0) cs.TimeSAT += r.Runtime;
                        if (r.UNSAT > 0) cs.TimeUNSAT += r.Runtime;

                        if ((r.SAT + r.UNSAT) < (r.TargetSAT + r.TargetUNSAT) || (r.UNKNOWN > r.TargetUNKNOWN))
                            cs.UnderPerformers++;
                        break;
                    }
                default: throw new Exception("Unexpected result code: " + r.ResultCode);
            }

            cs.Files++;

            return true;
        }
    }
}
