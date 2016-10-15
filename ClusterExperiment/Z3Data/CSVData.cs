using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.IO.Packaging;
using System.Data;

namespace Z3Data
{
    public class CSVRow
    {
        string[] _data = null;
        public CSVRow(string[] s) { _data = new string[12]; s.CopyTo(_data, 0); }
        public string Filename { get { return _data[0]; } }
        public int ReturnValue { get { return Convert.ToInt32(_data[1]); } }
        public double Runtime { get { return Convert.ToDouble(_data[2]); } }
        public uint ResultCode { get { return Convert.ToUInt32(_data[3]); } }
        public uint SAT { get { return Convert.ToUInt32(_data[4]); } }
        public uint UNSAT { get { return Convert.ToUInt32(_data[5]); } }
        public uint UNKNOWN { get { return Convert.ToUInt32(_data[6]); } }
        public uint TargetSAT { get { return Convert.ToUInt32(_data[7]); } }
        public uint TargetUNSAT { get { return Convert.ToUInt32(_data[8]); } }
        public uint TargetUNKNOWN { get { return Convert.ToUInt32(_data[9]); } }
        public string StdOut { get { return _data[10]; } }
        public string StdErr { get { return _data[11]; } }

        public string[] Data { get { return _data; } }
    };

    public class CSVRowList : List<CSVRow> { };

    public class CSVData : IDisposable
    {
        Uri _zipUri = null;
        string _zipFilename = null;
        uint _id = 0;
        string[] _columnNames = null;
        CSVRowList _rows = null;

        public CSVData(string dataDir, uint id, bool readOnly)
        {
            _zipUri = PackUriHelper.CreatePartUri(new Uri(id.ToString() + ".csv", UriKind.Relative));
            _zipFilename = dataDir + @"\" + id.ToString() + ".zip";
            _id = id;

            // MigrateData(dataDir, id);

            if (!File.Exists(_zipFilename))
                CreateZip(readOnly);

            LoadRows();
        }

        public void Dispose()
        {
            // Keep the file.
            _columnNames = null;
            _rows = null;
        }

        ~CSVData()
        {
            _zipUri = null;
            _zipFilename = null;
        }

        private void CreateZip(bool readOnly)
        {
            if (readOnly)
                throw new FileNotFoundException("Job data not found for job #" + _id);
            else {
                using (Package pkg = Package.Open(_zipFilename, FileMode.Create))
                {
                    PackagePart p = pkg.CreatePart(_zipUri, System.Net.Mime.MediaTypeNames.Text.Plain, CompressionOption.Maximum);
                    using (StreamWriter sw = new StreamWriter(p.GetStream(FileMode.Create, FileAccess.ReadWrite)))
                        sw.WriteLine("Filename,ReturnValue,Runtime,ResultCode," +
                                     "SAT,UNSAT,UNKNOWN,TargetSAT,TargetUNSAT,TargetUNKNOWN,StdOut,StdErr");
                }
            }
        }

        public DateTime LastModification { get { return File.GetLastWriteTime(_zipFilename); } }

        //private void MigrateData(string dataDir, uint id)
        //{
        //    string _oldDataFilename = dataDir + @"\" + id.ToString() + ".csv";

        //    if (File.Exists(_oldDataFilename) && !File.Exists(_zipFilename))
        //    {
        //        Package pkg = Package.Open(_zipFilename, FileMode.OpenOrCreate);
        //        if (pkg.PartExists(_zipUri)) pkg.DeletePart(_zipUri);
        //        ZipPackagePart p = (ZipPackagePart)pkg.CreatePart(_zipUri, System.Net.Mime.MediaTypeNames.Text.Plain, CompressionOption.Maximum);
        //        FileStream df = new FileStream(_oldDataFilename, FileMode.Open, FileAccess.Read);
        //        df.CopyTo(p.GetStream());
        //        df.Close();
        //        pkg.Close();

        //        File.Move(_oldDataFilename, _oldDataFilename + ".BACKUP");
        //    }
        //}

        public static string Escape(string s)
        {
            return s.Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "\\r");
        }

        public static string Unescape(string s)
        {
            return s.Replace("\\\"", "\"").Replace("\\n", "\n").Replace("\\r", "\r");
        }

        private Package _pkg = null;
        private PackagePart _part = null;
        private Stream _strm = null;
        private StreamWriter _wrtr = null;

        public void BeginAddingRows()
        {
            _pkg = Package.Open(_zipFilename, FileMode.Open, FileAccess.ReadWrite);
            _part = _pkg.GetPart(_zipUri);
            _strm = _part.GetStream(FileMode.Open, FileAccess.ReadWrite);
            _wrtr = new StreamWriter(_strm);
        }

        public void AddRow(string filename, int returnValue, double time, uint resultCode,
                           uint sat, uint unsat, uint unknown,
                           uint targetSat, uint targetUnsat, uint targetUnknown,
                           string stdOut, string stdErr)
        {
            _strm.Seek(0, SeekOrigin.End);

            string[] objects = new string[] {
                    "\"" + Escape(filename) + "\"", returnValue.ToString(),
                    time.ToString(), resultCode.ToString(),
                    sat.ToString(), unsat.ToString(), unknown.ToString(),
                    targetSat.ToString(), targetUnsat.ToString(), targetUnknown.ToString(),
                    "\"" + Escape(stdOut) + "\"",
                    "\"" + Escape(stdErr) + "\"" };

            foreach (string s in objects)
                _wrtr.Write(s + ',');
            _wrtr.WriteLine();
        }

    public void EndAddingRows()
    {
        _wrtr.Close(); _wrtr.Dispose(); _wrtr = null;
        _strm.Close(); _strm.Dispose(); _strm = null;
        _pkg.Close(); _pkg = null;
    }

    public string[] ColumnNames { get { return _columnNames; } }

    public CSVRowList Rows { get { return _rows; } }

    private void LoadRows()
    {
        using (Package pkg = Package.Open(_zipFilename, FileMode.Open, FileAccess.Read, FileShare.Read))
        {
            PackagePart part = pkg.GetPart(_zipUri);
            using (Stream s = part.GetStream(FileMode.Open, FileAccess.Read))
            using (StreamReader r = new StreamReader(s))
            {
                if (r.EndOfStream)
                    throw new Exception("CSV header missing");

                string line = r.ReadLine();
                _columnNames = line.Split(',');

                int i, j, c;
                bool inString = false, haveString = false;
                _rows = new CSVRowList();
                string[] objects = new string[12];
                while (!r.EndOfStream)
                {
                    line = r.ReadLine();
                    j = 0; c = 0; haveString = false;
                    for (i = 0; i < line.Length; i++)
                    {
                        if (!inString)
                        {
                            if (line[i] == ',')
                            {
                                if (haveString)
                                    objects[c] = line.Substring(j + 1, i - j - 2);
                                else
                                    objects[c] = line.Substring(j, i - j);
                                c++;
                                j = i + 1;
                                haveString = false;
                            }
                            else if (line[i] == '\"')
                            {
                                inString = true;
                                haveString = true;
                            }
                        }
                        else
                        {
                            if (line[i] == '\\')
                                i++;
                            else if (line[i] == '\"')
                                inString = false;
                        }
                    }
                    _rows.Add(new CSVRow(objects));
                }
            }
        }
    }
}
}
