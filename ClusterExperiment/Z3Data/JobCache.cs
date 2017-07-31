using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;

namespace Z3Data
{
    public class JobCache : IDisposable
    {
        string _dataDir = null;
        string _filename = null;
        Job _j = null;
        Job _reference = null;

        public JobCache(string dataDir, Job j)
        {
            _dataDir = dataDir;
            _filename = dataDir + @"\" + j.MetaData.Id.ToString() + "_cache.csv";
            _j = j;
        }

        public void Dispose()
        {
            _errorsByCategory = null;
            _bugsByCategory = null;
            _underperformersByCategory = null;
            _dippersByCategory = null;
        }

        protected enum ParserType { NONE, ERRORS, BUGS, UNDERPERFORMERS, DIPPERS };

        protected void Load()
        {
            if (!File.Exists(_filename))
                Rebuild();
            else
            {
                if (File.GetLastWriteTime(_filename) < _j.MetaData.LastDataModification)
                    Rebuild();
                else
                {
                    SetupData();

                    FileStream fs = File.Open(_filename, FileMode.Open, FileAccess.Read, FileShare.Read);
                    StreamReader f = new StreamReader(fs);

                    ParserType t = ParserType.NONE;

                    while (!f.EndOfStream)
                    {
                        string s = f.ReadLine();
                        string[] tokens = s.Split(',');

                        if (tokens.Count() == 1)
                        {
                            switch (tokens[0])
                            {
                                case "":
                                    // empty line
                                    continue;
                                case "[ERRORS]":
                                    t = ParserType.ERRORS;
                                    break;
                                case "[BUGS]":
                                    t = ParserType.BUGS;
                                    break;
                                case "[UNDERPERFORMERS]":
                                    t = ParserType.UNDERPERFORMERS;
                                    break;
                                case "[DIPPERS]":
                                    t = ParserType.DIPPERS;
                                    break;
                            }
                        }
                        else
                        {
                            switch (t)
                            {
                                case ParserType.ERRORS:
                                    _errorsByCategory[tokens[0]].Add(tokens[1]);
                                    _errorsByCategory[""].Add(tokens[1]);
                                    break;
                                case ParserType.BUGS:
                                    _bugsByCategory[tokens[0]].Add(tokens[1]);
                                    _bugsByCategory[""].Add(tokens[1]);
                                    break;
                                case ParserType.UNDERPERFORMERS:
                                    _underperformersByCategory[tokens[0]].Add(tokens[1]);
                                    _underperformersByCategory[""].Add(tokens[1]);
                                    break;
                                case ParserType.DIPPERS:
                                    _dippersByCategory[tokens[0]].Add(tokens[1]);
                                    _dippersByCategory[""].Add(tokens[1]);
                                    break;
                            }
                        }
                    }

                    f.Close();
                    fs.Close();
                }
            }
        }

        protected void Save()
        {
            FileStream fs = File.Open(_filename, FileMode.OpenOrCreate, FileAccess.Write, FileShare.Read);
            StreamWriter f = new StreamWriter(fs);

            f.WriteLine("[ERRORS]");
            foreach (KeyValuePair<string, List<string>> kvp in _errorsByCategory)
            {
                if (kvp.Key != "")
                    foreach (string s in kvp.Value)
                        f.WriteLine(kvp.Key + "," + s);
            }

            f.WriteLine("[BUGS]");
            foreach (KeyValuePair<string, List<string>> kvp in _bugsByCategory)
            {
                if (kvp.Key != "")
                    foreach (string s in kvp.Value)
                        f.WriteLine(kvp.Key + "," + s);
            }

            f.WriteLine("[UNDERPERFORMERS]");
            foreach (KeyValuePair<string, List<string>> kvp in _underperformersByCategory)
            {
                if (kvp.Key != "")
                    foreach (string s in kvp.Value)
                        f.WriteLine(kvp.Key + "," + s);
            }


            f.WriteLine("[DIPPERS]");
            foreach (KeyValuePair<string, List<string>> kvp in _dippersByCategory)
            {
                if (kvp.Key != "")
                    foreach (string s in kvp.Value)
                        f.WriteLine(kvp.Key + "," + s);
            }

            f.Close();
            fs.Close();
        }

        protected void Rebuild()
        {
            Stopwatch sw = new Stopwatch();
            sw.Restart();

            SetupData();

            if (_j.MetaData.Reference != 0)
                _reference = new Job(_dataDir, _j.MetaData.Reference);

            Dictionary<string, double> referenceTimes = null;
            if (_reference != null)
            {
                referenceTimes = new Dictionary<string, double>();
                foreach (CSVRow r in _reference.Rows)
                {
                    if (r.ResultCode == ResultCode.OK)
                    {
                        // Duplicates?
                        if (referenceTimes.ContainsKey(r.Filename))
                            referenceTimes[r.Filename] = r.Runtime;
                        else
                            referenceTimes.Add(r.Filename, r.Runtime);
                    }
                }
            }

            foreach (CSVRow r in _j.Rows)
            {
                uint rc = r.ResultCode;

                if (ResultCode.IsBug(rc))
                {
                    string fn = r.Filename;
                    string cat = fn.Substring(0, fn.IndexOf('\\'));
                    if (!_bugsByCategory.ContainsKey(cat))
                        _bugsByCategory.Add(cat, new List<string>());
                    _bugsByCategory[cat].Add(fn);
                    _bugsByCategory[""].Add(fn);
                }
                else if (ResultCode.IsError(rc))
                {
                    string fn = r.Filename;
                    string cat = fn.Substring(0, fn.IndexOf('\\'));
                    if (!_errorsByCategory.ContainsKey(cat))
                        _errorsByCategory.Add(cat, new List<string>());
                    _errorsByCategory[cat].Add(fn);
                    _errorsByCategory[""].Add(fn);
                }
                else if (ResultCode.IsOK(rc))
                {
                    uint have = r.SAT + r.UNSAT;
                    uint target = r.TargetSAT + r.TargetUNSAT;
                    if (have < target)
                    {
                        string fn = r.Filename;
                        string cat = fn.Substring(0, fn.IndexOf('\\'));
                        if (!_underperformersByCategory.ContainsKey(cat))
                            _underperformersByCategory.Add(cat, new List<string>());
                        _underperformersByCategory[cat].Add(fn);
                        _underperformersByCategory[""].Add(fn);
                    }

                    if (referenceTimes != null && referenceTimes.ContainsKey(r.Filename))
                    {
                        double new_time = r.Runtime;
                        double old_time = referenceTimes[r.Filename];

                        if (new_time > 1 && old_time > 1 &&
                            new_time >= 10.0 * old_time)
                        {
                            string fn = r.Filename;
                            string cat = fn.Substring(0, fn.IndexOf('\\'));
                            string msg = fn + " [" + (new_time - old_time) + " sec. slower]";
                            if (!_dippersByCategory.ContainsKey(cat))
                                _dippersByCategory.Add(cat, new List<string>());
                            _dippersByCategory[cat].Add(msg);
                            _dippersByCategory[""].Add(msg);
                        }
                    }
                }
                else if (ResultCode.IsTime(rc))
                {
                    if (referenceTimes != null && referenceTimes.ContainsKey(r.Filename))
                    {
                        double old_time = referenceTimes[r.Filename];
                        double new_time = _j.MetaData.Timeout;

                        if ((new_time - old_time) > 10)
                        {
                            string fn = r.Filename;
                            string cat = fn.Substring(0, fn.IndexOf('\\'));
                            string msg = fn + " [more than " + (new_time-old_time) + " sec. slower]";
                            if (!_dippersByCategory.ContainsKey(cat))
                            _dippersByCategory.Add(cat, new List<string>());
                            _dippersByCategory[cat].Add(msg);
                            _dippersByCategory[""].Add(msg);
                        }
                    }
                }
                else if (ResultCode.IsMemory(rc))
                {
                    if (referenceTimes != null && referenceTimes.ContainsKey(r.Filename))
                    {
                        double old_time = referenceTimes[r.Filename];

                        string fn = r.Filename;
                        string cat = fn.Substring(0, fn.IndexOf('\\'));
                        string msg = fn + " [went from " + old_time + " sec. to memory-out]";
                        if (!_dippersByCategory.ContainsKey(cat))
                            _dippersByCategory.Add(cat, new List<string>());
                        _dippersByCategory[cat].Add(msg);
                        _dippersByCategory[""].Add(msg);
                    }
                }
            }

            Save();
            Global.Say("Rebuilding cache for #" + _j.MetaData.Id + " in " + sw.Elapsed.TotalSeconds + " sec.");
        }

        protected void SetupData()
        {
            _bugsByCategory = new Dictionary<string, List<string>>();
            _errorsByCategory = new Dictionary<string, List<string>>();
            _underperformersByCategory = new Dictionary<string, List<string>>();
            _dippersByCategory = new Dictionary<string, List<string>>();
            foreach (string s in _j.Summary.Categories)
            {
                _bugsByCategory.Add(s, new List<string>());
                _errorsByCategory.Add(s, new List<string>());
                _underperformersByCategory.Add(s, new List<string>());
                _dippersByCategory.Add(s, new List<string>());
            }
            _bugsByCategory.Add("", new List<string>());
            _errorsByCategory.Add("", new List<string>());
            _underperformersByCategory.Add("", new List<string>());
            _dippersByCategory.Add("", new List<string>());
        }

        public Dictionary<string, List<string>> Errors
        {
            get
            {
                if (_errorsByCategory == null) Load();
                return _errorsByCategory;
            }
        }

        public Dictionary<string, List<string>> Bugs
        {
            get
            {
                if (_bugsByCategory == null) Load();
                return _bugsByCategory;
            }
        }

        public Dictionary<string, List<string>> Underperformers
        {
            get
            {
                if (_underperformersByCategory == null) Load();
                return _underperformersByCategory;
            }
        }

        public Dictionary<string, List<string>> Dippers
        {
            get
            {
                if (_dippersByCategory == null) Load();
                return _dippersByCategory;
            }
        }

        Dictionary<string, List<string>> _errorsByCategory = null;
        Dictionary<string, List<string>> _bugsByCategory = null;
        Dictionary<string, List<string>> _underperformersByCategory = null;
        Dictionary<string, List<string>> _dippersByCategory = null;
    }
}
