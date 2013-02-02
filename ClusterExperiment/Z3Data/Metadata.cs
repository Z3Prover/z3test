using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Z3Data
{
    public class MetaData
    {
        public MetaData(string dataDir, uint id)
        {
            _filename = dataDir + @"\" + id.ToString() + "_meta.csv";
            _id = id;

            if (File.Exists(_filename))                
                Load();
        }        

        public uint Id { get { return _id; } set { _id = value; } }
        public string Filename { get { return _filename; } set { _filename = value; } }
        public DateTime SubmissionTime { get { return _submitTime; } set { _submitTime = value; } }
        public string Cluster { get { return _cluster; } set { _cluster = value; } }
        public uint ClusterJobId { get { return _clusterJobId; } set { _clusterJobId = value; } }
        public string BaseDirectory { get { return _baseDir; } set { _baseDir = value; } }
        public uint BinaryId { get { return _binaryId; } set { _binaryId = value; } }
        public string Parameters { get { return _parameters; } set { _parameters = value; } }
        public uint Timeout { get { return _timeout; } set { _timeout = value; } }
        public uint Memoryout { get { return _memoryout; } set { _memoryout = value; } }
        public string Nodegroup { get { return _nodeGroup; } set { _nodeGroup = value; } }
        public string Locality { get { return _locality; } set { _locality = value; } }
        public uint Reference { get { return _reference; } set { _reference = value; } }
        public bool isFinished { get { return _isFinished; } set { _isFinished = value; } }        

        protected void Load()
        {
            FileStream fs = File.Open(_filename, FileMode.Open, FileAccess.Read, FileShare.Read);
            StreamReader r = new StreamReader(fs);
            
            while (!r.EndOfStream)
            {
                string line = r.ReadLine();
                int inx = line.IndexOf('=');
                string entry = line.Substring(0, inx);
                string rest = line.Substring(inx+1);
                switch (entry.ToUpper())
                {
                    case "ID": _id = Convert.ToUInt32(rest);  break;
                    case "SUBMITTIME": _submitTime = Convert.ToDateTime(rest, Global.culture); break;
                    case "BASEDIRECTORY": _baseDir = rest; break;
                    case "BINARYID": _binaryId = Convert.ToUInt32(rest); break;
                    case "PARAMETERS": _parameters = rest; break;
                    case "TIMEOUT": _timeout = Convert.ToUInt32(rest); break;
                    case "MEMORYOUT": _memoryout = Convert.ToUInt32(rest); break;
                    case "CLUSTER": _cluster = rest; break;
                    case "CLUSTERJOBID": _clusterJobId = Convert.ToUInt32(rest); break;
                    case "NODEGROUP": _nodeGroup = rest; break;
                    case "LOCALITY": _locality = rest; break;
                    case "REFERENCE": _reference = Convert.ToUInt32(rest); break;
                    case "FINISHED": _isFinished = Convert.ToBoolean(rest); break;
                    default: /* unknown token, ignore. */ break;
                }
            }

            r.Close();
            fs.Close();
        }

        public void Save()
        {
            FileStream f;
            if (!File.Exists(_filename))
                f = File.Create(_filename);
            else
                f = File.Open(_filename, FileMode.Truncate);
            StreamWriter w = new StreamWriter(f);

            w.WriteLine("ID=" + _id.ToString());
            w.WriteLine("SUBMITTIME=" + _submitTime.ToString(Global.culture));
            w.WriteLine("BASEDIRECTORY=" + _baseDir.ToString());
            w.WriteLine("BINARYID=" + _binaryId.ToString());
            w.WriteLine("PARAMETERS=" + _parameters.ToString());
            w.WriteLine("TIMEOUT=" + _timeout.ToString());
            w.WriteLine("MEMORYOUT=" + _memoryout.ToString());
            w.WriteLine("CLUSTER=" + _cluster.ToString());
            w.WriteLine("CLUSTERJOBID=" + _clusterJobId.ToString());
            w.WriteLine("NODEGROUP=" + _nodeGroup.ToString());
            w.WriteLine("LOCALITY=" + _locality.ToString());
            w.WriteLine("REFERENCE=" + _reference.ToString());
            w.WriteLine("FINISHED=" + _isFinished.ToString());

            w.Close();
            f.Close();
        }

        // internals
        uint _id = 0;
        string _filename = null;
        DateTime _submitTime;
        string _cluster = "";
        uint _clusterJobId = 0;
        string _baseDir = "";
        uint _binaryId = 0;
        string _parameters = "";
        uint _timeout = 0;
        uint _memoryout = 0;
        string _nodeGroup = "";
        string _locality = "";
        uint _reference = 0;
        bool _isFinished = false;
    }
}
