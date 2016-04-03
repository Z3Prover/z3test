using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;

namespace Z3Data
{
    public class Record
    {
        public double Time = double.PositiveInfinity;
        public uint JobId = 0;

        public Record(double t, uint id) { Time = t; JobId = id; }
    }

    public class CategoryRecord
    {
        public double Time = double.PositiveInfinity;
        public uint Files = 0;

        public CategoryRecord(double t, uint f) { Time = t; Files = f; }

        public void Add(CategoryRecord other)
        {
            Time += other.Time;
            Files += other.Files;
        }
    }

    public class Records
    {
        string _dataDir = null;
        string _filename = null;
        string _summaryFilename = null;
        Dictionary<string, Record> _records = null;
        Dictionary<string, CategoryRecord> _summary = null;
        bool _modified = false;

        public Records(string dataDir)
        {
            _dataDir = dataDir;
            _filename = dataDir + @"\record_cache.csv";
            _summaryFilename = dataDir + @"\record_cache_summary.csv";
            _records = new Dictionary<string, Record>(100000);
            Load();
        }

        public void Update(Job j)
        {
            uint jid = j.MetaData.Id;
            foreach (CSVRow r in j.Rows)
            {
                if (r.ResultCode == ResultCode.OK &&
                    r.UNKNOWN == 0 &&
                    (r.SAT + r.UNSAT) > 0)
                {
                    Update(r.Filename, r.Runtime, jid);
                }
            }
        }

        public CategoryRecord Overall
        {
            get
            {
                CategoryRecord res = new CategoryRecord(0.0, 0);
                foreach (KeyValuePair<string, CategoryRecord> kvp in _summary)
                    res.Add(kvp.Value);
                return res;
            }
        }

        public Dictionary<string, CategoryRecord> RecordsByCategory { get { return _summary; } }

        protected void Update(string filename, double time, uint jobId)
        {
            if (!_records.ContainsKey(filename))
            {
                _records.Add(filename, new Record(time, jobId));
                string category = filename.Substring(0, filename.IndexOf(@"\"));
                if (!_summary.ContainsKey(category)) _summary.Add(category, new CategoryRecord(0.0, 0));
                _summary[category].Time += time;
                _summary[category].Files++;
                _modified = true;
            }
            else if (_records[filename].Time > time)
            {
                _records[filename].Time = time;
                _records[filename].JobId = jobId;
                string category = filename.Substring(0, filename.IndexOf(@"\"));
                if (!_summary.ContainsKey(category)) _summary.Add(category, new CategoryRecord(0.0, 0));
                _summary[category].Time += time;
                _summary[category].Files++;
                _modified = true;
            }
        }

        protected void RebuildSummary()
        {
            _summary = new Dictionary<string, CategoryRecord>();

            foreach (KeyValuePair<string, Record> kvp in _records)
            {
                string filename = kvp.Key;
                string category = filename.Substring(0, filename.IndexOf(@"\"));
                if (!_summary.ContainsKey(category)) _summary.Add(category, new CategoryRecord(0.0, 0));
                _summary[category].Time += kvp.Value.Time;
                _summary[category].Files++;
            }

            SaveSummary();
        }

        public void Load()
        {
            if (!File.Exists(_filename))
                Rebuild();
            else
            {
                using (FileStream s = new FileStream(_filename, FileMode.Open))
                using (StreamReader r = new StreamReader(s))
                    while (!r.EndOfStream)
                    {
                        string[] tokens = r.ReadLine().Split(',');
                        string fn = tokens[0].Substring(1);
                        fn = fn.Substring(0, fn.Length - 1);
                        _records.Add(fn, new Record(Convert.ToDouble(tokens[1]),
                                                    Convert.ToUInt32(tokens[2])));
                    }
            }


            if (!File.Exists(_summaryFilename) ||
                File.GetLastWriteTime(_filename) > File.GetLastWriteTime(_summaryFilename))
                RebuildSummary();
            else
            {
                _summary = new Dictionary<string, CategoryRecord>();

                using (FileStream ss = new FileStream(_summaryFilename, FileMode.Open))
                using (StreamReader sr = new StreamReader(ss))
                    while (!sr.EndOfStream)
                    {
                        string[] tokens = sr.ReadLine().Split(',');
                        _summary.Add(tokens[0], new CategoryRecord(Convert.ToDouble(tokens[1]), Convert.ToUInt32(tokens[2])));
                    }
            }
        }

        public void Save()
        {
            if (_modified)
            {
                using (FileStream s = new FileStream(_filename, FileMode.Create))
                using (StreamWriter w = new StreamWriter(s))
                    foreach (KeyValuePair<string, Record> kvp in _records)
                        w.WriteLine("\"" + CSVData.Escape(kvp.Key) + "\"," +
                                    kvp.Value.Time.ToString() + "," +
                                    kvp.Value.JobId.ToString());

                SaveSummary();
                _modified = false;
            }
        }

        public void SaveSummary()
        {
            using (FileStream s = new FileStream(_summaryFilename, FileMode.Create))
            using (StreamWriter w = new StreamWriter(s))
                foreach (KeyValuePair<string, CategoryRecord> kvp in _summary)
                    w.WriteLine(kvp.Key + "," + kvp.Value.Time + "," + kvp.Value.Files);
        }

        protected void Rebuild()
        {
            Stopwatch sw = new Stopwatch();
            sw.Restart();

            _records.Clear();
            _summary = new Dictionary<string, CategoryRecord>();

            Jobs jobs = new Jobs(_dataDir, true);
            foreach (Job j in jobs)
            {
                Update(j);
                j.Dispose();
                System.GC.Collect();
            }

            Save();
            SaveSummary();

            Global.Say("Rebuilt record cache in " + sw.Elapsed.TotalSeconds + " sec.");

        }
    }
}
