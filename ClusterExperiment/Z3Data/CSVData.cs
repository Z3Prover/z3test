using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Data;

namespace Z3Data
{
    public class CSVRow
    {
        string[] _data = null;
        public CSVRow(string[] s) { _data = new string[12]; s.CopyTo(_data, 0);  }
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
        string _filename = null;
        FileStream _file = null;
        string[] _columnNames = null;
        CSVRowList _rows = null;
        StreamReader _reader = null;
        StreamWriter _writer = null;

        public CSVData(string filename)
        {
            _filename = filename;
            bool is_new = !File.Exists(_filename);
            _file = File.Open(_filename, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);            
            if (is_new) WriteHeader();
            ReadHeader();
        }

        public void Dispose()
        {
            // Keep the file.
            if (_reader != null) _reader.Close();
            _reader = null;            
            _columnNames = null;
            _rows = null;
            _filename = null;
        }

        ~CSVData()
        {
            if (_file == null) _file.Close();
            _file = null;
        }

        protected void WriteHeader()
        {
            _file.Seek(0, SeekOrigin.End);
            _writer = new StreamWriter(_file);
            _writer.WriteLine("Filename,ReturnValue,Runtime,ResultCode," +
                        "SAT,UNSAT,UNKNOWN,TargetSAT,TargetUNSAT,TargetUNKNOWN,StdOut,StdErr");
            _writer.Flush();
        }

        protected void ReadHeader()
        {            
            _file.Seek(0, SeekOrigin.Begin);
            _reader = new StreamReader(_file);
            if (_reader.EndOfStream)
                throw new Exception("CSV header missing");
            string line = _reader.ReadLine();
            _columnNames = line.Split(',');
        }

        public static string Escape(string s)
        {
            return s.Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "\\r");
        }

        public static string Unescape(string s)
        {
            return s.Replace("\\\"", "\"").Replace("\\n", "\n").Replace("\\r", "\r");
        }

        public void AddRow(CSVRow r)
        {
            _file.Seek(0, SeekOrigin.End);
            if (_writer == null)
                _writer = new StreamWriter(_file);
            foreach (string s in r.Data)
            {
                _writer.Write(s);
                _writer.Write(',');
            }
            _writer.WriteLine();
            _writer.Flush();
        }

        public void AddRow(string filename, int returnValue, double time, uint resultCode,
                           uint sat, uint unsat, uint unknown,
                           uint targetSat, uint targetUnsat, uint targetUnknown,
                           string stdOut, string stdErr)
        {
            _file.Seek(0, SeekOrigin.End);
            if (_writer == null)
                _writer = new StreamWriter(_file);

            string[] objects = new string[] { 
                "\"" + Escape(filename) + "\"", returnValue.ToString(), 
                time.ToString(), resultCode.ToString(), 
                sat.ToString(), unsat.ToString(), unknown.ToString(), 
                targetSat.ToString(), targetUnsat.ToString(), targetUnknown.ToString(), 
                "\"" + Escape(stdOut) + "\"",
                "\"" + Escape(stdErr) + "\"" };

            foreach (string s in objects)
            {
                _writer.Write(s);
                _writer.Write(',');
            }
            _writer.WriteLine();
            _writer.Flush();
        }

        public string[] ColumnNames { get { return _columnNames; } }

        public CSVRowList Rows
        {
            get
            {
                if (_rows == null)
                {                    
                    ReadHeader();
                    string line;
                    int i, j, c;
                    bool inString = false, haveString = false;
                    _rows = new CSVRowList();
                    string[] objects = new string[12];
                    while (!_reader.EndOfStream)
                    {
                        line = _reader.ReadLine();
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
                                {
                                    i++;
                                }
                                else if (line[i] == '\"')
                                {
                                    inString = false;
                                }
                            }
                        }                        
                        _rows.Add(new CSVRow(objects));
                    }
                }
                return _rows;
            }
        }
    }
}
