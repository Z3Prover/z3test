using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Diagnostics;
using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;

namespace Z3Data
{
    class JobDataIndex
    {
        public const int Filename = 0;
        public const int ReturnValue = 1;
        public const int Time = 2;
        public const int ResultCode = 3;
        public const int SAT = 4;
        public const int UNSAT = 5;
        public const int UNKNOWN = 6;
        public const int TargetSAT = 7;
        public const int TargetUNSAT = 8;
        public const int TargetUNKNOWN = 9;

        // Note: in case of TIME/MEM, the following are inserted after ResultCode.
        public const int OutputString = 4;
        public const int ErrorString = 5;

    };

    public class Job : IComparable<Job>, IDisposable
    {
        #region Internal
        // internal stuff
        string _dataDir = null;
        string _dataFilename = null;
        bool _needSummaryRebuild = false;

        CSVData _data = null;
        MetaData _metaData = null;
        Summary _summary = null;
        JobCache _cache = null;

        TimeSpan _downloadTime = new TimeSpan(0);
        uint _downloadBatches = 0;
        #endregion

        public Job(string dataDir, uint id = 0, bool readOnly = false)
        {
            if (!Directory.Exists(dataDir))
                throw new Exception("Data directory does not exist.");
            if (id == 0)
                throw new Exception("Job must have non-zero id.");

            _dataDir = dataDir;
            _dataFilename = _dataDir + @"\" + id.ToString() + ".csv";

            if (readOnly && !File.Exists(_dataFilename))
                throw new FileNotFoundException("File not found: " + _dataFilename);

            _metaData = new MetaData(dataDir, id);
            _summary = new Summary(dataDir, this);
            // if the summary is rebuilt, it will load all the data,
            // which we can forget for now.
            if (_data != null) { _data.Dispose(); _data = null; }
            _cache = new JobCache(dataDir, this);
        }

        public double AverageBatchTime
        {
            get
            {
                return _downloadTime.TotalSeconds / _downloadBatches;
            }
        }

        public uint BatchCount
        {
            get { return _downloadBatches; }
        }

        public Job(uint id, SQLInterface sql)
        {
            _metaData.Id = id;
            Download(sql);
        }

        public void Dispose()
        {
            RebuildSummary();
            _dataDir = null;
            _dataFilename = null;
            if (_data != null) _data.Dispose();
            _data = null;
            _metaData = null;            
            _summary = null;
            if (_cache != null) _cache.Dispose();
            _cache = null;            
        }

        public void Download(SQLInterface sql)
        {
            // Global.Say("Downloading #" + _metaData.Id);

            Dictionary<string, Object> r = sql.Read("SELECT " +
                "ID,SubmissionTime,SharedDir,Binary,Parameters,Timeout,Memout," +
                "Cluster,ClusterJobId,Nodegroup,Locality FROM Experiments " +
                "WHERE ID=" + _metaData.Id.ToString() + ";");

            if (SQLInterface.getuint(ref r, "ID") != _metaData.Id)
                throw new Exception("Job ID mismatch");

            _metaData.SubmissionTime = Convert.ToDateTime(r["SubmissionTime"], Global.culture);
            _metaData.BaseDirectory = r["SharedDir"].ToString();
            _metaData.BinaryId = Convert.ToUInt32(r["Binary"]);
            _metaData.Parameters = r["Parameters"].ToString();
            _metaData.Timeout = Convert.ToUInt32(r["Timeout"]);
            _metaData.Memoryout = Convert.ToUInt32(r["Memout"]);
            _metaData.Cluster = r["Cluster"].ToString();
            _metaData.ClusterJobId = SQLInterface.getuint(ref r, "ClusterJobId");
            _metaData.Nodegroup = r["Nodegroup"].ToString();
            _metaData.Locality = r["Locality"].ToString();
            _metaData.isFinished = false;
            _metaData.Save();

            r.Clear();

            _data = new CSVData(_dataFilename);

            bool have_new_data = false;
            while (GetBatch(sql) > 0) have_new_data = true;

            if (have_new_data)
                _summary.Rebuild(this);

            string ids = _metaData.Id.ToString();

            bool clusterDone = false;
            if (_metaData.Cluster != "" && _metaData.ClusterJobId != 0)
            {
                try
                {
                    r = sql.Read("SELECT COUNT(1) FROM JobQueue WHERE ExperimentID=" + ids);
                    if ((int)r.First().Value != 0)
                        clusterDone = false;
                    else
                    {
                        Scheduler scheduler = new Scheduler();
                        scheduler.Connect(_metaData.Cluster);
                        ISchedulerJob job = scheduler.OpenJob((int)_metaData.ClusterJobId);
                        JobState state = job.State;
                        if (state == JobState.Finished ||
                            state == JobState.Finishing ||
                            state == JobState.Failed ||
                            state == JobState.Canceled ||
                            state == JobState.Canceling)
                            clusterDone = true;
                    }
                }
                catch (SchedulerException ex)
                {
                    if (ex.Code == ErrorCode.Operation_InvalidJobId)
                        clusterDone = true;
                    else
                        Global.Say("Job considered not finished because the scheduler threw: " + ex.Message);
                }
                catch
                {
                    clusterDone = false;
                }
            }

            if (clusterDone)
            {
                // Delete the experiment only if the job on the cluster is done and there are no more jobs.
                Dictionary<string, object> q =
                    sql.Read("(SELECT (SELECT COUNT(1) FROM Data WHERE ExperimentID=" + ids + ") + " +
                             "(SELECT COUNT(1) FROM JobQueue WHERE ExperimentID=" + ids + "))");

                if (q.Count > 0 && (int)q.First().Value == 0)
                {
                    // Cluster is done & database is done.
                    sql.Query("DELETE FROM Experiments WHERE ID=" + ids);
                    _metaData.isFinished = true;
                    _metaData.Save();
                }
            }
        }

        protected int GetBatch(SQLInterface sql)
        {
            Stopwatch timer = new Stopwatch();
            timer.Restart();

            List<int> ids = new List<int>();
            SqlDataReader r = null;
            uint limit = 1000;
            string order = "ORDER BY ID";

            try
            {
                ids.Clear();
                r = sql.GetReader("SELECT TOP " + limit + " Data.ID as ID,s as Filename,Runtime,Returnvalue,ResultCode,stdout,stderr,SAT,UNSAT,UNKNOWN,TargetSAT,TargetUNSAT,TargetUNKNOWN FROM Data,Strings WHERE ExperimentID=" + _metaData.Id.ToString() + " AND FilenameP=Strings.ID " + order + ";");

                if (!r.HasRows) { r.Close(); return 0; }
                //Global.Say("Query time: " + (DateTime.Now - before).TotalSeconds + " sec");

                while (r.Read())
                {
                    string fn = (string)r["Filename"];
                    fn = fn.Substring(fn.IndexOf('\\') + 1); // remove top-level `smtlib-latest' dir.
                    _data.AddRow(fn,
                           SQLInterface.getint(ref r, "Returnvalue"),
                           SQLInterface.getdouble(ref r, "Runtime"),
                           SQLInterface.getuint(ref r, "ResultCode"),
                           SQLInterface.getuint(ref r, "SAT"),
                           SQLInterface.getuint(ref r, "UNSAT"),
                           SQLInterface.getuint(ref r, "UNKNOWN"),
                           SQLInterface.getuint(ref r, "TargetSAT"),
                           SQLInterface.getuint(ref r, "TargetUNSAT"),
                           SQLInterface.getuint(ref r, "TargetUNKNOWN"),
                           SQLInterface.getstring(ref r, "stdout"),
                           SQLInterface.getstring(ref r, "stderr")
                    );

                    ids.Add(Convert.ToInt32(r["ID"]));
                }

                r.Close();
            }
            catch (SqlException ex)
            {
                if (ex.Number != -2) throw ex;
                // Else that's OK.
            }

            if (!r.IsClosed) r.Close();

            int i = 0;
            string query = "";
            while (i < ids.Count)
            {
                int range_start = (int)ids[i];
                int range_end = range_start;

                while (i < ids.Count - 1 && ((int)ids[i + 1]) == range_end + 1) { range_end++; i++; }

                if (query == "")
                    query = "DELETE FROM Data WHERE (ID>=" + range_start + " AND ID<=" + range_end + ") ";
                else
                    query += "OR (ID>=" + range_start + " AND ID<=" + range_end + ") ";
                i++;
            }

            sql.Query(query);
            //Global.Say("Delete time: " + (DateTime.Now - b).TotalSeconds + " sec");
            //Global.Say("Downloaded " + ids.Count + " entries for experiment " + eid + ".");

            timer.Stop();
            _downloadBatches++;
            _downloadTime += timer.Elapsed;
            return ids.Count;
        }

        public void RebuildSummary()
        {
            if (_needSummaryRebuild)
            {
                _summary.Rebuild(this);
                _needSummaryRebuild = false;
            }
        }

        public int CompareTo(Job other)
        {
            return MetaData.Id.CompareTo(other.MetaData.Id);
        }

        #region Properties
        public MetaData MetaData { get { return _metaData; } }
        public Summary Summary { get { return _summary; } }
        public string DataFilename { get { return _dataFilename; } }

        public string[] Columns
        {
            get
            {
                if (_data == null) _data = new CSVData(_dataFilename);
                return _data.ColumnNames;
            }
        }

        public void AddRow(CSVRow r)
        {
            if (_data == null) _data = new CSVData(_dataFilename);
            _data.AddRow(r);
        }

        public CSVRowList Rows
        {
            get
            {
                if (_data == null) _data = new CSVData(_dataFilename);
                return _data.Rows;
            }
        }

        public DateTime LastDataModification
        {
            get
            {
                return File.GetLastWriteTime(_dataFilename);
            }
        }

        public Dictionary<string, List<string>> Errors
        {
            get
            {
                return _cache.Errors;
            }
        }

        public Dictionary<string, List<string>> Bugs
        {
            get
            {
                return _cache.Bugs;
            }
        }

        public Dictionary<string, List<string>> Underperformers
        {
            get
            {
                return _cache.Underperformers;
            }
        }

        public Dictionary<string, List<string>> Dippers
        {
            get
            {
                return _cache.Dippers;
            }
        }        
        #endregion        
    }
}
