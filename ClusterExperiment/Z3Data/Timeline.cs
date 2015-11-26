using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Z3Data
{
    public class Timeline
    {
        string _dataDir = null;
        ArrayList _rows = null;
        Dictionary<string, int> _col2inx = new Dictionary<string, int>();
        public Timeline(string dir, string dataDir, string filename)
        {
            _dataDir = dataDir;

            Load(dir, filename);
        }

        public Dictionary<string, CategoryStatistics> Categories
        {
            get { return _cats; }
        }

        public SortedSet<string> CategoryNames
        {
            get { return _catnames; }
        }

        public Job Job(uint id)
        {
            return new Job(_dataDir, id);
        }

        public Job LastJob
        {
            get { return Job(LastJobId); }
        }

        public Summary LastSummary
        {
            get { return new Summary(_dataDir, LastJob); }
        }

        public uint LastJobId
        {
            get { return _lastJobId; }
        }

        public int CategoryCount
        {
            get { return _cats.Count; }
        }

        public int RowCount
        {
            get { return _rows.Count; }
        }

        public string Lookup(int row, string cat)
        {
            int inx = _col2inx[cat];
            return ((string[])_rows[row])[inx];
        }

        protected void Load(string dir, string filename)
        {
            _cats = new Dictionary<string, CategoryStatistics>();
            _catnames = new SortedSet<string>();

            StreamReader f = new StreamReader(Path.IsPathRooted(filename) ? filename : dir + "\\" + filename);

            string line = f.ReadLine();

            if (line == null)
                return;

            int colcount = 0;
            string[] a = line.Split(',');
            foreach (string s in a)
            {
                string ss = s.Trim('"');
                _col2inx[ss] = colcount++;

                int del_inx = ss.IndexOf('|');
                if (del_inx < 0)
                    continue;

                string cat = ss.Substring(0, del_inx);

                if (!_cats.ContainsKey(cat))
                {
                    _cats.Add(cat, new CategoryStatistics());
                    _catnames.Add(cat);
                }

            }

            _rows = new ArrayList();

            while (!f.EndOfStream)
            {
                line = f.ReadLine();
                a = line.Split(',');
                if (a.Length > 2)
                {
                    uint id = Convert.ToUInt32(a[1]);
                    if (id > _lastJobId)
                        _lastJobId = id;
                    string[] b = new string[a.Count()];
                    for (uint i = 0; i < a.Count(); i++)
                        b[i] = a[i].Trim('"');
                    _rows.Add(b);
                }
            }
        }

        public static void Make(StreamWriter f, ref Jobs jobs)
        {
            int[] codes = { 0, 1, 2, 3, 4, 6, 5, 7, 8, 9, 98, 99 };
            string[] codenames = { "SAT", "UNSAT", "UNKNOWN", "BUG", "ERROR", "MEMORY", "TIMEOUT", "SATTIME", "UNSATTIME", "INFERR", "OVERPERF", "UNDERPERF" };

            f.Write("Date,ID");
            HashSet<string> categories = new HashSet<string>();

            foreach (Job j in jobs)
            {
                foreach (string cat in j.Summary.Categories)
                    if (!categories.Contains(cat))
                        categories.Add(cat);
            }

            foreach (string c in categories)
                for (int i = 0; i < codes.Length; i++)
                    f.Write(",\"" + c + "|" + codenames[i] + "\"");

            f.WriteLine();

            foreach (Job j in jobs)
            {
                f.Write("\"" + j.MetaData.SubmissionTime.ToString(Global.culture) + "\",");
                f.Write(j.MetaData.Id.ToString());

                foreach (string category in categories)
                {
                    Summary s = j.Summary;

                    for (int i = 0; i < codes.Length; i++)
                    {
                        int code = codes[i];
                        string name = codenames[i];
                        if (!s.ContainsKey(category))
                        {
                            f.Write(",0");
                        }
                        else
                        {
                            CategoryStatistics cs = s[category];
                            switch (code)
                            {
                                case 0: f.Write("," + cs.SAT.ToString()); break;
                                case 1: f.Write("," + cs.UNSAT.ToString()); break;
                                case 2: f.Write("," + cs.UNKNOWN.ToString()); break;
                                case 3: f.Write("," + cs.Bugs.ToString()); break;
                                case 4: f.Write("," + cs.Errors.ToString()); break;
                                case 5: f.Write("," + cs.Timeout.ToString()); break;
                                case 6: f.Write("," + cs.Memout.ToString()); break;
                                case 7: f.Write("," + cs.TimeSAT.ToString()); break;
                                case 8: f.Write("," + cs.TimeUNSAT.ToString()); break;
                                case 9: f.Write("," + cs.InfrastructureErrors.ToString()); break;
                                case 98: f.Write("," + cs.Overperformers.ToString()); break;
                                case 99: f.Write("," + cs.UnderPerformers.ToString()); break;
                            }
                        }
                    }
                }

                f.WriteLine();
            }
        }


        // Cached stuff.
        Dictionary<string, CategoryStatistics> _cats = null;
        SortedSet<string> _catnames = null;
        uint _lastJobId = 0;
    }
}
