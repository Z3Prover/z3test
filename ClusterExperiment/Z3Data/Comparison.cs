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
    public class Comparison
    {
        public class Point
        {
            public double x, y;
            public string tooltip = null;
            public bool isSpecial = false;
        };

        protected Job _jX = null, _jY = null;
        protected Tags _tags = null;
        protected double _minX = 0.1, _minY = 0.1;
        protected double _maxX = 10000.0, _maxY = 10000.0;
        protected double _tmeX = 1200.0, _tmeY = 1200.0;
        protected double _memX = 2000.0, _memY = 2000.0;
        protected double _errX = 4000.0, _errY = 4000.0;

        protected uint _x_but_not_y = 0, _y_but_not_x = 0;

        protected static int csvrow_lt(CSVRow x, CSVRow y) { return x.Filename.CompareTo(y.Filename); }

        public Comparison(Job jX, Job jY, Tags tags = null)
        {
            _jX = jX;
            _jY = jY;
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
                return MkDatapoints();
            }
        }

        protected List<Point> MkDatapoints()
        {
            _jX.Rows.Sort(csvrow_lt);
            _jY.Rows.Sort(csvrow_lt);

            List<Point> res = new List<Point>();

            List<CSVRow>.Enumerator yit = _jY.Rows.GetEnumerator();
            CSVRow yr = null;

            uint cnt = 0;

            foreach (CSVRow xr in _jX.Rows)
            {
                cnt++;
                // if (cnt == 10000) break;

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

                if (xr.ResultCode == ResultCode.OK && yr.ResultCode == ResultCode.OK &&
                    (xr.SAT > yr.SAT || xr.UNSAT > yr.UNSAT))
                    p.isSpecial = true;

                res.Add(p);
            }

            return res;
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
        public string Title { get { return (!HasJobs) ? "Comparison" : NameX + " vs " + NameY; } }

        public bool HasJobs { get { return _jX != null && _jY != null; } }
    }
}
