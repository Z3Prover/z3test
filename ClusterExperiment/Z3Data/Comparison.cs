using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;
using System.Data;
using System.Drawing;

namespace Z3Data
{
    public class ComparisonStatistics
    {
        public double Count = 0;

        public double x_countSAT = 0.0;
        public double x_countUNSAT = 0.0;
        public double x_countUNKNOWN = 0.0;
        public double x_cumulativeTimeSAT = 0.0;
        public double x_cumulativeTimeUNSAT = 0.0;
        public double x_cumulativeTimeUNKNOWN = 0.0;

        public double y_countSAT = 0.0;
        public double y_countUNSAT = 0.0;
        public double y_countUNKNOWN = 0.0;
        public double y_cumulativeTimeSAT = 0.0;
        public double y_cumulativeTimeUNSAT = 0.0;
        public double y_cumulativeTimeUNKNOWN = 0.0;

        public HashSet<string> files = new HashSet<string>();
        public Dictionary<string, ComparisonStatistics> postfixes = null;
        public Dictionary<string, ComparisonStatistics> subdirs = null;

        public double CountX { get { return x_countSAT + x_countUNSAT + x_countUNKNOWN; } }
        public double CountY { get { return y_countSAT + y_countUNSAT + y_countUNKNOWN; } }

        public double TimeX { get { return x_cumulativeTimeSAT + x_cumulativeTimeUNSAT + x_cumulativeTimeUNKNOWN; } }
        public double TimeY { get { return y_cumulativeTimeSAT + y_cumulativeTimeUNSAT + y_cumulativeTimeUNKNOWN; } }

        public double AvgTimeX { get { return TimeX/Count; }}
        public double AvgTimeY { get { return TimeY/Count; }}

        public double AvgSATTimeX { get { return x_cumulativeTimeSAT / x_countSAT;  } }
        public double AvgUNSATTimeX { get { return x_cumulativeTimeSAT / x_countSAT; } }
        public double AvgUNKNOWNTimeX { get { return x_cumulativeTimeSAT / x_countSAT; } }

        public double AvgSATTimeY { get { return x_cumulativeTimeSAT / x_countSAT; } }
        public double AvgUNSATTimeY { get { return x_cumulativeTimeSAT / x_countSAT; } }
        public double AvgUNKNOWNTimeY { get { return x_cumulativeTimeSAT / x_countSAT; } }
    };

    public class Comparison
    {
        public enum PointType { EQUAL, BETTER, WORSE };

        public class Point
        {
            public double x, y;
            public string tooltip = null;
            public PointType type = PointType.EQUAL;
        };

        protected Job _jX = null, _jY = null;
        protected string _prefix = null;
        protected int _prefixLength = 0;
        protected Tags _tags = null;
        protected double _minX = 0.1, _minY = 0.1;
        protected double _maxX = 10000.0, _maxY = 10000.0;
        protected double _tmeX = 1200.0, _tmeY = 1200.0;
        protected double _memX = 2000.0, _memY = 2000.0;
        protected double _errX = 4000.0, _errY = 4000.0;
        protected List<Point> _datapoints = null;
        protected ComparisonStatistics _statistics = null;

        protected uint _x_but_not_y = 0, _y_but_not_x = 0;

        protected static int csvrow_lt(CSVRow x, CSVRow y) { return x.Filename.CompareTo(y.Filename); }

        public Comparison(Job jX, Job jY, string prefix = "", Tags tags = null)
        {
            _jX = jX;
            _jY = jY;
            _prefix = prefix;
            _prefixLength = prefix.Length;
            if (_prefix != "") _prefixLength++;
            if (tags != null) _tags = tags;

            if (_jX != null)
            {
                _tmeX = _jX.MetaData.Timeout;
                _memX = _tmeX + 1000;
                _errX = _memX + 2000;
                _maxX = _errX;
            }

            if (_jY != null)
            {
                _tmeY = _jY.MetaData.Timeout;
                _memY = _tmeY + 1000;
                _errY = _memY + 2000;
                _maxY = _errY;
            }
        }

        public List<Point> Datapoints
        {
            get
            {
                if (_datapoints == null)
                    ComputeStatistics();
                return _datapoints;
            }
        }

        public ComparisonStatistics Statistics
        {
            get
            {
                if (_statistics == null)
                    ComputeStatistics();
                return _statistics;
            }
        }

        protected void AddDataPoint(CSVRow xr, CSVRow yr)
        {
            double xrt = (xr.Runtime < _minX) ? _minX : xr.Runtime;
            double yrt = (yr.Runtime < _minY) ? _minY : yr.Runtime;

            Comparison.Point p = new Point();
            // p.tooltip = xr.Filename;

            switch (xr.ResultCode)
            {
                case ResultCode.MEMORY: p.x = _memX; break;
                case ResultCode.TIME: p.x = _tmeX; break;
                case ResultCode.OK: p.x = xrt; break;
                default: p.x = _errX; break;
            }

            switch (yr.ResultCode)
            {
                case ResultCode.MEMORY: p.y = _memY; break;
                case ResultCode.TIME: p.y = _tmeY; break;
                case ResultCode.OK: p.y = yrt; break;
                default: p.y = _errY; break;
            }

            if (xr.SAT > yr.SAT || xr.UNSAT > yr.UNSAT)
                p.type = PointType.WORSE;
            else if (xr.SAT < yr.SAT || xr.UNSAT < yr.UNSAT)
                p.type = PointType.BETTER;

            _datapoints.Add(p);
        }

        protected void AddStatistics(CSVRow xr, CSVRow yr)
        {
            int liobs = xr.Filename.LastIndexOf("\\");
            string prefix = xr.Filename.Substring(0, liobs);
            string filename = xr.Filename.Substring(liobs+1);
            string suffix = xr.Filename.Substring(_prefixLength, liobs - _prefixLength);           
            int subdir_inx = suffix.IndexOf("\\");
            string subdir = subdir_inx < 0 ? "" : suffix.Substring(0, subdir_inx);
            _statistics.Count += 1.0;            
            
            if (suffix.Length > 0 && !_statistics.postfixes.ContainsKey(suffix))
                _statistics.postfixes.Add(suffix, new ComparisonStatistics());

            if (subdir_inx != -1 && !_statistics.subdirs.ContainsKey(subdir))
                _statistics.subdirs.Add(subdir, new ComparisonStatistics());

            if (xr.ResultCode == ResultCode.OK && yr.ResultCode == ResultCode.OK)
            {
                double x_ratio_sat = xr.SAT / (xr.SAT + xr.UNSAT + xr.UNKNOWN);
                double x_ratio_unsat = xr.UNSAT / (xr.SAT + xr.UNSAT + xr.UNKNOWN);
                double x_ratio_unknown = xr.UNKNOWN / (xr.SAT + xr.UNSAT + xr.UNKNOWN);

                double y_ratio_sat = yr.SAT / (yr.SAT + yr.UNSAT + yr.UNKNOWN);
                double y_ratio_unsat = yr.UNSAT / (yr.SAT + yr.UNSAT + yr.UNKNOWN);
                double y_ratio_unknown = yr.UNKNOWN / (yr.SAT + yr.UNSAT + yr.UNKNOWN);

                if (suffix == "") _statistics.files.Add(suffix + filename);

                _statistics.x_cumulativeTimeSAT += x_ratio_sat * xr.Runtime;
                _statistics.x_cumulativeTimeUNSAT += x_ratio_unsat * xr.Runtime;
                _statistics.x_cumulativeTimeUNKNOWN += x_ratio_unknown * xr.Runtime;
                _statistics.x_countSAT += xr.SAT;
                _statistics.x_countUNSAT += xr.UNSAT;
                _statistics.x_countUNKNOWN += xr.UNKNOWN;

                _statistics.y_cumulativeTimeSAT += y_ratio_sat * yr.Runtime;
                _statistics.y_cumulativeTimeUNSAT += y_ratio_unsat * yr.Runtime;
                _statistics.y_cumulativeTimeUNKNOWN += y_ratio_unknown * yr.Runtime;
                _statistics.y_countSAT += yr.SAT;
                _statistics.y_countUNSAT += yr.UNSAT;
                _statistics.y_countUNKNOWN += yr.UNKNOWN;

                if (suffix.Length > 0)
                {
                    _statistics.postfixes[suffix].files.Add(filename);

                    _statistics.postfixes[suffix].x_cumulativeTimeSAT += x_ratio_sat * xr.Runtime;
                    _statistics.postfixes[suffix].x_cumulativeTimeUNSAT += x_ratio_unsat * xr.Runtime;
                    _statistics.postfixes[suffix].x_cumulativeTimeUNKNOWN += x_ratio_unknown * xr.Runtime;
                    _statistics.postfixes[suffix].x_countSAT += xr.SAT;
                    _statistics.postfixes[suffix].x_countUNSAT += xr.UNSAT;
                    _statistics.postfixes[suffix].x_countUNKNOWN += xr.UNKNOWN;

                    _statistics.postfixes[suffix].y_cumulativeTimeSAT += y_ratio_sat * yr.Runtime;
                    _statistics.postfixes[suffix].y_cumulativeTimeUNSAT += y_ratio_unsat * yr.Runtime;
                    _statistics.postfixes[suffix].y_cumulativeTimeUNKNOWN += y_ratio_unknown * yr.Runtime;
                    _statistics.postfixes[suffix].y_countSAT += yr.SAT;
                    _statistics.postfixes[suffix].y_countUNSAT += yr.UNSAT;
                    _statistics.postfixes[suffix].y_countUNKNOWN += yr.UNKNOWN;
                }

                if (subdir_inx != -1)
                {
                    _statistics.subdirs[subdir].files.Add(suffix + "\\" + filename);

                    _statistics.subdirs[subdir].x_cumulativeTimeSAT += x_ratio_sat * xr.Runtime;
                    _statistics.subdirs[subdir].x_cumulativeTimeUNSAT += x_ratio_unsat * xr.Runtime;
                    _statistics.subdirs[subdir].x_cumulativeTimeUNKNOWN += x_ratio_unknown * xr.Runtime;
                    _statistics.subdirs[subdir].x_countSAT += xr.SAT;
                    _statistics.subdirs[subdir].x_countUNSAT += xr.UNSAT;
                    _statistics.subdirs[subdir].x_countUNKNOWN += xr.UNKNOWN;

                    _statistics.subdirs[subdir].y_cumulativeTimeSAT += y_ratio_sat * yr.Runtime;
                    _statistics.subdirs[subdir].y_cumulativeTimeUNSAT += y_ratio_unsat * yr.Runtime;
                    _statistics.subdirs[subdir].y_cumulativeTimeUNKNOWN += y_ratio_unknown * yr.Runtime;
                    _statistics.subdirs[subdir].y_countSAT += yr.SAT;
                    _statistics.subdirs[subdir].y_countUNSAT += yr.UNSAT;
                    _statistics.subdirs[subdir].y_countUNKNOWN += yr.UNKNOWN;
                }
            }                       
        }

        protected void ComputeStatistics()
        {
            _datapoints = new List<Point>();
            _statistics = new ComparisonStatistics();
            _statistics.postfixes = new Dictionary<string, ComparisonStatistics>();
            _statistics.subdirs = new Dictionary<string, ComparisonStatistics>();

            _jX.Rows.Sort(csvrow_lt);
            _jY.Rows.Sort(csvrow_lt);

            List<CSVRow>.Enumerator yit = _jY.Rows.GetEnumerator();
            CSVRow yr = null;

            foreach (CSVRow xr in _jX.Rows)
            {                                
                if (!xr.Filename.StartsWith(_prefix))
                    continue;

                do
                {
                    if (yit.MoveNext()) yr = yit.Current; else yr = null;
                    if (yr != null && yr.Filename.CompareTo(xr.Filename) >= 0) break;
                    _y_but_not_x++;
                }
                while (yr != null);

                if (yr == null)
                    continue;

                if (yr.Filename.CompareTo(xr.Filename) != 0)
                {
                    _x_but_not_y++;
                    continue;
                }

                AddDataPoint(xr, yr);
                AddStatistics(xr, yr);
            }
        }

        public double MinX { get { return _minX; } }
        public double MinY { get { return _minY; } }
        public double MaxX { get { return _maxX; } }
        public double MaxY { get { return _maxX; } }
        public double TimeOutX { get { return _tmeX; } }
        public double TimeOutY { get { return _tmeY; } }
        public double MemOutX { get { return _memX; } }
        public double MemOutY { get { return _memY; } }
        public double ErrorX { get { return _errX; } }
        public double ErrorY { get { return _errY; } }
        public Job JobX { get { return _jX; } }
        public Job JobY { get { return _jY; } }
        
        public string NameX
        {
            get
            {
                if (_jX == null)
                    return "No such job";
                else if (_tags != null && _tags.HasTag(_jX.MetaData.Id))
                    return _tags.Name(_jX) + "  " + _jX.MetaData.SubmissionTime.ToShortDateString();
                else
                    return "#" + _jX.MetaData.Id.ToString() + "  " + _jX.MetaData.SubmissionTime.ToShortDateString();
            }
        }

        public string ShortNameX
        {
            get
            {
                if (_jX == null)
                    return "No such job";
                else if (_tags != null && _tags.HasTag(_jX.MetaData.Id))
                    return _tags.Name(_jX);
                else
                    return "#" + _jX.MetaData.Id.ToString();
            }
        }

        public string DateX
        {
            get
            {
                if (_jX == null)
                    return "No date";
                else
                    return _jX.MetaData.SubmissionTime.ToShortDateString();
            }
        }

        public string NameY
        {
            get
            {
                if (_jY == null)
                    return "No such job";
                else if (_tags != null)
                    return _tags.Name(_jY) + "  " + _jY.MetaData.SubmissionTime.ToShortDateString();
                else
                    return "#" + _jY.MetaData.Id.ToString() + "  " + _jY.MetaData.SubmissionTime.ToShortDateString();
            }
        }

        public string ShortNameY
        {
            get
            {
                if (_jY == null)
                    return "No such job";
                else if (_tags != null && _tags.HasTag(_jY.MetaData.Id))
                    return _tags.Name(_jY);
                else
                    return "#" + _jY.MetaData.Id.ToString();
            }
        }

        public string DateY
        {
            get
            {
                if (_jY == null)
                    return "No date";
                else
                    return _jY.MetaData.SubmissionTime.ToShortDateString();
            }
        }

        public string Title { get { return (!HasJobs) ? "Comparison" : NameX + " vs " + NameY; } }

        public bool HasJobs { get { return _jX != null && _jY != null; } }
    }
}
