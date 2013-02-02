using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Data;
using System.Data.OleDb;

namespace Z3Data
{
    public class Timeline : DataSet
    {
        string _dataDir = null;

        public Timeline(string dir, string dataDir, string filename)
        {
            _dataDir = dataDir;

            Load(dir, filename);

            if (Tables.Count != 1)
                throw new Exception("Dataset does not contain exactly one table.");
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

        protected void Load(string dir, string filename)
        {
            string connString = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties=Text;", dir);
            string cmdString = string.Format("SELECT * FROM {0} ORDER BY ID ASC", filename);

            OleDbDataAdapter dataAdapter = new OleDbDataAdapter(cmdString, connString);
            dataAdapter.Fill(this);

            _cats = new Dictionary<string, CategoryStatistics>();
            _catnames = new SortedSet<string>();
            foreach (DataColumn c in Tables[0].Columns)
            {
                string s = c.ColumnName;
                int del_inx = s.IndexOf('|');

                if (del_inx < 0)
                    continue;

                string cat = s.Substring(0, del_inx);

                if (!_cats.ContainsKey(cat))
                {
                    _cats.Add(cat, new CategoryStatistics());
                    _catnames.Add(cat);
                }
            }            

            foreach (DataRow r in Tables[0].Rows)
            {
                uint id = Convert.ToUInt32(r["Id"]);
                if (id > _lastJobId)
                    _lastJobId = id;
            }
        }

        public static void Make(StreamWriter f, ref Jobs jobs)
        {
            int[] codes = { 0, 1, 2, 3, 4, 6, 5, 7, 8, 98, 99 };
            string[] codenames = { "SAT", "UNSAT", "UNKNOWN", "BUG", "ERROR", "MEMORY", "TIMEOUT", "SATTIME", "UNSATTIME", "OVERPERF", "UNDERPERF" };

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
