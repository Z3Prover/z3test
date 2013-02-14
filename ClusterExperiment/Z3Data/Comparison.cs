using System;
using System.Collections;
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
        public double Count = 0.0;

        public double x_files;
        public double x_countSAT = 0.0;
        public double x_countUNSAT = 0.0;
        public double x_countUNKNOWN = 0.0;
        public double x_cumulativeTimeSAT = 0.0;
        public double x_cumulativeTimeUNSAT = 0.0;
        public double x_cumulativeTimeUNKNOWN = 0.0;

        public double y_files;
        public double y_countSAT = 0.0;
        public double y_countUNSAT = 0.0;
        public double y_countUNKNOWN = 0.0;
        public double y_cumulativeTimeSAT = 0.0;
        public double y_cumulativeTimeUNSAT = 0.0;
        public double y_cumulativeTimeUNKNOWN = 0.0;

        public Dictionary<string, ComparisonStatistics> postfixes = null;
        public Dictionary<string, ComparisonStatistics> subdirs = null;

        public double CountX { get { return x_countSAT + x_countUNSAT + x_countUNKNOWN; } }
        public double CountY { get { return y_countSAT + y_countUNSAT + y_countUNKNOWN; } }

        public double TimeX { get { return x_cumulativeTimeSAT + x_cumulativeTimeUNSAT + x_cumulativeTimeUNKNOWN; } }
        public double TimeY { get { return y_cumulativeTimeSAT + y_cumulativeTimeUNSAT + y_cumulativeTimeUNKNOWN; } }

        public double AvgTimeX { get { return TimeX / CountX; } }
        public double AvgTimeY { get { return TimeY / CountY; } }

        public double AvgSATTimeX { get { return x_cumulativeTimeSAT / x_countSAT; } }
        public double AvgUNSATTimeX { get { return x_cumulativeTimeSAT / x_countSAT; } }
        public double AvgUNKNOWNTimeX { get { return x_cumulativeTimeSAT / x_countSAT; } }

        public double AvgSATTimeY { get { return x_cumulativeTimeSAT / x_countSAT; } }
        public double AvgUNSATTimeY { get { return x_cumulativeTimeSAT / x_countSAT; } }
        public double AvgUNKNOWNTimeY { get { return x_cumulativeTimeSAT / x_countSAT; } }

        public ArrayList deltas = new ArrayList();
        public bool deltas_sorted = false;

        public double DeltaMean
        {
            get
            {
                double res = 0.0;
                foreach (double d in deltas) { res += d; }
                return deltas.Count > 0 ? res / deltas.Count : 0.0;
            }
        }

        public double DeltaP(uint p)
        {
            if (!deltas_sorted) { deltas.Sort(); deltas_sorted = true; }
            if (deltas.Count == 0) return 0.0;            
            int rank = (int)Math.Round((((double)p) / 100.0 * deltas.Count) - 0.5);
            return (double)deltas[rank];
        }

        public double DeltaP1 { get { return DeltaP(1); } }
        public double DeltaP25 { get { return DeltaP(25); } }
        public double DeltaP50 { get { return DeltaP(50); } }
        public double DeltaP75 { get { return DeltaP(75); } }
        public double DeltaP99 { get { return DeltaP(99); } }

        public double DeltaSTD
        {
            get
            {
                double mean = DeltaMean;
                double sum = 0.0;
                double N = deltas.Count;
                foreach (double d in deltas)
                    sum += (d - mean) * (d - mean);
                return N > 1 ? Math.Sqrt((1 / (N - 1)) * sum) : 0.0;
            }
        }

        public List<uint> Histogramm(double lost, double gained)
        {
            // [Lost] [>Timeout;-500] [-500;-50] [-50; -5] [-5;-1] [-.5;+.5] [+1;+5] [+5; +50] [+50; +500] [+500;<Timeout] [Gained]
            List<uint> res = new List<uint>();
            for (uint i = 0; i < 11; i++)
                res.Add(0);

            foreach (double d in deltas)
            {
                if (d <= lost)
                    res[0]++;
                else if (d < -500.0)
                    res[1]++;
                else if (d < -50.0)
                    res[2]++;
                else if (d < -5.0)
                    res[3]++;
                else if (d < -0.5)
                    res[4]++;
                else if (d < +0.5)
                    res[5]++;
                else if (d < +5.0)
                    res[6]++;
                else if (d < +50.0)
                    res[7]++;
                else if (d < +500.0)
                    res[8]++;
                else if (d < gained)
                    res[9]++;
                else
                    res[10]++;
            }

            return res;
        }
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

        public List<uint> Histogramm
        {
            get
            {
                if (_statistics == null)
                    ComputeStatistics();
                return _statistics.Histogramm(-_tmeX, _tmeY);
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
            p.tooltip = xr.Filename;

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

        protected string Suffix(CSVRow row)
        {
            int liobs = row.Filename.LastIndexOf("\\");
            if (liobs <= _prefixLength) return "";
            string prefix = row.Filename.Substring(0, liobs);
            string suffix = row.Filename.Substring(_prefixLength, liobs - _prefixLength);
            if (suffix.Length > 0 && !_statistics.postfixes.ContainsKey(suffix))
                _statistics.postfixes.Add(suffix, new ComparisonStatistics());
            return suffix;
        }

        protected string Subdir(CSVRow row)
        {
            string suffix = Suffix(row);
            int subdir_inx = suffix.IndexOf("\\");
            string subdir = suffix == "" ? "" : (subdir_inx < 0 ? suffix : suffix.Substring(0, subdir_inx));
            if (subdir.Length > 0)
            {
                if (!_statistics.subdirs.ContainsKey(subdir))
                    _statistics.subdirs.Add(subdir, new ComparisonStatistics());
            }
            return subdir;
        }

        protected void AddStatisticsX(CSVRow row)
        {
            _statistics.x_files++;

            if (row.ResultCode == ResultCode.OK)
            {
                double results = (row.SAT + row.UNSAT + row.UNKNOWN);
                double x_ratio_sat = results == 0 ? 0 : row.SAT / results;
                double x_ratio_unsat = results == 0 ? 0 : row.UNSAT / results;
                double x_ratio_unknown = results == 0 ? 0 : row.UNKNOWN / results;

                _statistics.x_cumulativeTimeSAT += x_ratio_sat * row.Runtime;
                _statistics.x_cumulativeTimeUNSAT += x_ratio_unsat * row.Runtime;
                _statistics.x_cumulativeTimeUNKNOWN += x_ratio_unknown * row.Runtime;
                _statistics.x_countSAT += row.SAT;
                _statistics.x_countUNSAT += row.UNSAT;
                _statistics.x_countUNKNOWN += row.UNKNOWN;

                string suffix = Suffix(row);
                string subdir = Subdir(row);

                if (suffix.Length > 0)
                {
                    _statistics.postfixes[suffix].x_files++;
                    _statistics.postfixes[suffix].x_cumulativeTimeSAT += x_ratio_sat * row.Runtime;
                    _statistics.postfixes[suffix].x_cumulativeTimeUNSAT += x_ratio_unsat * row.Runtime;
                    _statistics.postfixes[suffix].x_cumulativeTimeUNKNOWN += x_ratio_unknown * row.Runtime;
                    _statistics.postfixes[suffix].x_countSAT += row.SAT;
                    _statistics.postfixes[suffix].x_countUNSAT += row.UNSAT;
                    _statistics.postfixes[suffix].x_countUNKNOWN += row.UNKNOWN;
                }

                if (subdir.Length > 0)
                {
                    _statistics.subdirs[subdir].x_files++;
                    _statistics.subdirs[subdir].x_cumulativeTimeSAT += x_ratio_sat * row.Runtime;
                    _statistics.subdirs[subdir].x_cumulativeTimeUNSAT += x_ratio_unsat * row.Runtime;
                    _statistics.subdirs[subdir].x_cumulativeTimeUNKNOWN += x_ratio_unknown * row.Runtime;
                    _statistics.subdirs[subdir].x_countSAT += row.SAT;
                    _statistics.subdirs[subdir].x_countUNSAT += row.UNSAT;
                    _statistics.subdirs[subdir].x_countUNKNOWN += row.UNKNOWN;
                }
            }
        }

        protected void AddStatisticsY(CSVRow row)
        {
            _statistics.y_files++;

            if (row.ResultCode == ResultCode.OK)
            {
                double results = (row.SAT + row.UNSAT + row.UNKNOWN);
                double y_ratio_sat = (results == 0) ? 0 : row.SAT / results;
                double y_ratio_unsat = (results == 0) ? 0 : row.UNSAT / results;
                double y_ratio_unknown = (results == 0) ? 0 : row.UNKNOWN / results;

                _statistics.y_cumulativeTimeSAT += y_ratio_sat * row.Runtime;
                _statistics.y_cumulativeTimeUNSAT += y_ratio_unsat * row.Runtime;
                _statistics.y_cumulativeTimeUNKNOWN += y_ratio_unknown * row.Runtime;
                _statistics.y_countSAT += row.SAT;
                _statistics.y_countUNSAT += row.UNSAT;
                _statistics.y_countUNKNOWN += row.UNKNOWN;

                string suffix = Suffix(row);
                string subdir = Subdir(row);

                if (suffix.Length > 0)
                {
                    _statistics.postfixes[suffix].y_files++;
                    _statistics.postfixes[suffix].y_cumulativeTimeSAT += y_ratio_sat * row.Runtime;
                    _statistics.postfixes[suffix].y_cumulativeTimeUNSAT += y_ratio_unsat * row.Runtime;
                    _statistics.postfixes[suffix].y_cumulativeTimeUNKNOWN += y_ratio_unknown * row.Runtime;
                    _statistics.postfixes[suffix].y_countSAT += row.SAT;
                    _statistics.postfixes[suffix].y_countUNSAT += row.UNSAT;
                    _statistics.postfixes[suffix].y_countUNKNOWN += row.UNKNOWN;
                }

                if (subdir.Length > 0)
                {
                    _statistics.subdirs[subdir].y_files++;
                    _statistics.subdirs[subdir].y_cumulativeTimeSAT += y_ratio_sat * row.Runtime;
                    _statistics.subdirs[subdir].y_cumulativeTimeUNSAT += y_ratio_unsat * row.Runtime;
                    _statistics.subdirs[subdir].y_cumulativeTimeUNKNOWN += y_ratio_unknown * row.Runtime;
                    _statistics.subdirs[subdir].y_countSAT += row.SAT;
                    _statistics.subdirs[subdir].y_countUNSAT += row.UNSAT;
                    _statistics.subdirs[subdir].y_countUNKNOWN += row.UNKNOWN;
                }
            }
        }

        protected void AddStatisticsXY(CSVRow xr, CSVRow yr)
        {
            string suffix = Suffix(xr);
            string subdir = Subdir(xr);

            _statistics.Count += 1.0;

            if (xr.ResultCode == ResultCode.OK || yr.ResultCode == ResultCode.OK)
            {
                double delta;

                if (xr.ResultCode == ResultCode.OK && yr.ResultCode == ResultCode.OK)
                    delta = yr.Runtime - xr.Runtime;
                else if (xr.ResultCode == ResultCode.OK && yr.ResultCode != ResultCode.OK)
                    delta = -_tmeY;
                else
                    delta = _tmeX;

                _statistics.deltas.Add(delta);
                _statistics.deltas_sorted = false;
                if (suffix.Length > 0)
                {
                    _statistics.postfixes[suffix].deltas.Add(delta);
                    _statistics.postfixes[suffix].deltas_sorted = false;
                }

                if (subdir.Length > 0)
                {
                    _statistics.subdirs[subdir].deltas.Add(delta);
                    _statistics.subdirs[subdir].deltas_sorted = false;
                }
            }
        }

        protected void ComputeStatistics()
        {
            _datapoints = new List<Point>();
            _statistics = new ComparisonStatistics();
            _statistics.postfixes = new Dictionary<string, ComparisonStatistics>();
            _statistics.subdirs = new Dictionary<string, ComparisonStatistics>();

            if (_jX == null || _jY == null) return;

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
                    if (yr.Filename.StartsWith(_prefix)) AddStatisticsY(yr);
                }
                while (yr != null);

                if (yr == null)
                    continue;

                if (yr.Filename.CompareTo(xr.Filename) != 0)
                {
                    AddStatisticsX(xr);
                    continue;
                }

                AddStatisticsX(xr);
                AddStatisticsY(yr);
                AddStatisticsXY(xr, yr);

                AddDataPoint(xr, yr);
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
