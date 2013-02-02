using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Z3Data;

namespace AlertLibrary
{
    public class Report
    {
        string _reportTextHTML = null;
        Alerts _alerts = null;
        string _linkPage = null;
        Dictionary<string, string> _images = new Dictionary<string, string>();
        Job _job = null;

        public Report(Job j)
        {
            _job = j;
            _linkPage = "http://Z3-1/Nightly/Default.aspx";
            _alerts = new Alerts(_job, _linkPage);
            _images.Add("ok", "ok.png");
            _images.Add("warning", "warning.png");
            _images.Add("critical", "critical.png");
        }

        public bool IsInteresting
        {
            get
            {
                return _alerts[""].Count > 0 && _alerts[""].Level != AlertLevel.None;
            }
        }

        public string ReportTextHTML
        {
            get
            {
                if (_reportTextHTML == null)
                    GenerateReportHTML();
                return _reportTextHTML;
            }
        }

        protected string MakeHTMLTable(string category)
        {
            AlertSet alertSet = _alerts[category];
            string res = "";

            if (alertSet.Count > 0)
            {
                res += "<table>";

                foreach (KeyValuePair<AlertLevel, List<string>> kvp in alertSet.Messages)
                {
                    AlertLevel level = kvp.Key;
                    List<string> messages = kvp.Value;

                    res += "<tr>";
                    switch (level)
                    {
                        case AlertLevel.None:
                            res += "<td align=left valign=top><img src='cid:ok'/></td>";
                            res += "<td align=left valign=middle><font color=Green>";
                            break;
                        case AlertLevel.Warning:
                            res += "<td align=left valign=top><img src='cid:warning'/></td>";
                            res += "<td align=left valign=middle><font color=Orange>";
                            break;
                        case AlertLevel.Critical:
                            res += "<td align=left valign=top><img src='cid:critical'/></td>";
                            res += "<td align=left valign=middle><font color=Red>";
                            break;
                    }
                    foreach (string m in messages)
                        res += m + "<br/>";
                    res += "</font></td>";

                    res += "<tr>";
                }

                res += "</table>";
            }
            return res;
        }

        protected void GenerateReportHTML()
        {
            uint id = _job.MetaData.Id;

            _reportTextHTML = "<body>";
            _reportTextHTML += "<h1>Z3 Nightly Alert Report</h1>";
            _reportTextHTML += "<p>This are alerts for <a href=" + _linkPage + "?job=" + id + " style='text-decoration:none'>job #" + id + "</a> (submitted " + _job.MetaData.SubmissionTime + ").</p>";

            if (_alerts[""].Count == 0)
            {
                _reportTextHTML += "<p>";
                _reportTextHTML += "<img src='cid:ok'/> ";
                _reportTextHTML += "<font color=Green>All is well everywhere!</font>";
                _reportTextHTML += "</p>";
            }
            else
            {
                _reportTextHTML += "<h2>Alert Summary</h2>";
                _reportTextHTML += MakeHTMLTable("");

                _reportTextHTML += "<h2>Detailed alerts</h2>";
                foreach (string cat in _alerts.Categories)
                {
                    if (cat != "" && _alerts[cat].Count > 0)
                    {
                        _reportTextHTML += "<h3><a href='" + _linkPage + "?cat=" + cat+ "' style='text-decoration:none'>" + cat + "</a></h3>";
                        _reportTextHTML += MakeHTMLTable(cat);
                    }
                }

                _reportTextHTML += "<p>For more information please see the <a href='" + _linkPage + "' style='text-decoration:none'>Z3 Nightly Webpage</a>.</p>";
            }

            _reportTextHTML += "</body>";
        }

        public void SendTo(List<string> to)
        {
            foreach (string receipient in to)
                Sendmail.Send(receipient, "Z3 Alerts", ReportTextHTML, null, _images, true);
        }
    }
}
