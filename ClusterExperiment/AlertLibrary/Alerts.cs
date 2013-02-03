// CM Wintersteiger, 2012

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.OleDb;

using Z3Data;

namespace AlertLibrary
{
    public enum AlertLevel { None, Warning, Critical };

    public class AlertSet
    {
        public AlertLevel Level = AlertLevel.None;
        public Dictionary<AlertLevel, List<string>> Messages = new Dictionary<AlertLevel, List<string>>();

        public AlertSet()
        {
        }

        public void Add(AlertLevel al, string message)
        {
            if ((Level == AlertLevel.None && al != Level) ||
                (Level == AlertLevel.Warning && al == AlertLevel.Critical))
                Level = al;

            if (!Messages.ContainsKey(al)) Messages.Add(al, new List<string>());
            Messages[al].Add(message);
        }

        public int Count
        {
            get
            {
                int res = 0;
                foreach (KeyValuePair<AlertLevel, List<string>> kvp in Messages)
                    res += kvp.Value.Count;
                return res;
            }
        }
    }

    public class Alerts
    {        
        Dictionary<string, AlertSet> alertSets = new Dictionary<string, AlertSet>();
        string _linkPage = null;
        Job _job = null;        

        public Alerts(Job j, string linkPage)
        {
            _job = j;
            _linkPage = linkPage;            
            
            foreach (string c in _job.Summary.Categories)
                if (c != "")
                    alertSets.Add(c, FindAlerts(c));

            AlertSet overall = new AlertSet();
            foreach (KeyValuePair<string, AlertSet> kvp in alertSets)
            {
                if (kvp.Key != "" && kvp.Value.Messages.Count != 0)
                    overall.Add(kvp.Value.Level,
                        string.Format("{0} alert{1} in <a href='" + _linkPage + "?cat={2}' style='text-decoration:none;'>{2}</a>.", kvp.Value.Count, kvp.Value.Count == 1 ? "" : "s", kvp.Key));
            }            
            alertSets.Add("", overall);
        }

        public IEnumerable<string> Categories
        {
            get
            {
                return alertSets.Keys.ToArray();
            }
        }

        public AlertSet this[string category]
        {
            get
            {
                if (alertSets.Keys.Contains(category))
                    return alertSets[category];
                else
                    return new AlertSet();
            }
        }

        protected AlertSet FindAlerts(string cat)
        {
            AlertSet res = new AlertSet();

            // Check for bugs != 0; This is critical.            
            uint bugs = (cat == "") ? _job.Summary.Overall.Bugs : _job.Summary[cat].Bugs;
            if (bugs != 0)
            {
                res.Add(AlertLevel.Critical,
                    string.Format("There {0} {1} bug{2}.", bugs == 1 ? "is" : "are", bugs, bugs == 1 ? "" : "s"));
            }


            // Check for errors != 0; this is just a warning.
            uint errors = (cat == "") ? _job.Summary.Overall.Errors : _job.Summary[cat].Errors;
            if (errors != 0)
            {
                res.Add(AlertLevel.Warning,
                    string.Format("There {0} {1} error{2}.", errors == 1 ? "is" : "are", errors, errors == 1 ? "" : "s"));
            }

            // See whether something got slower.            
            int dippers = (cat == "") ? _job.Dippers[""].Count : _job.Dippers[cat].Count;
            if (dippers != 0)
            {
                res.Add(AlertLevel.None,
                    string.Format("There {0} {1} benchmark{2} that show{3} a dip in performance.",
                                    dippers == 1 ? "is" : "are", dippers,
                                    dippers == 1 ? "" : "s",
                                    dippers == 1 ? "s" : ""));
            }

            return res;
        }
    }
}
