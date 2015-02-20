using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using System.Data;

using System.Web.UI.DataVisualization;
using System.Web.UI.DataVisualization.Charting;
using System.Globalization;

using AjaxControlToolkit;

using Z3Data;
using AlertLibrary;

namespace Nightly
{
    public partial class Compare : System.Web.UI.Page
    {
        Configuration config = null;
        public DateTime _startTime = DateTime.Now;
        Comparison cmp = null;
        uint top_n = 100;

        public TimeSpan RenderTime
        {
            get { return DateTime.Now - _startTime; }
        }

        protected string JX = (int.MaxValue - 1).ToString();
        protected string JY = (int.MaxValue).ToString();

        protected string Prefix
        {
            get
            {
                object o = ViewState["prefix"];
                if (o != null) return (string)o;
                return "";
            }
            set { ViewState["prefix"] = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                config = Application["Configuration"] as Configuration;

                string px = null, py = null;

                if (!IsPostBack)
                {
                    Timeline tl = new Timeline(Server.MapPath("~"), config.datadir, config.timeline);

                    string penultimate = tl.Lookup(tl.RowCount - 2, "ID").ToString();
                    string latest = tl.Lookup(tl.RowCount - 1, "ID").ToString();

                    lstTagX.Items.Add(new ListItem("Latest (" + latest + ")", latest));
                    lstTagX.Items.Add(new ListItem("Penultimate (" + penultimate + ")", penultimate));
                    lstTagY.Items.Add(new ListItem("Latest (" + latest + ")", latest));
                    lstTagY.Items.Add(new ListItem("Penultimate (" + penultimate + ")", penultimate));

                    foreach (KeyValuePair<string, uint> kvp in config.tags)
                    {
                        lstTagX.Items.Add(new ListItem(kvp.Key + " (" + kvp.Value.ToString() + ")", kvp.Value.ToString()));
                        lstTagY.Items.Add(new ListItem(kvp.Key + " (" + kvp.Value.ToString() + ")", kvp.Value.ToString()));
                    }

                    px = Request.Params.Get("jobX");
                    py = Request.Params.Get("jobY");
                    Prefix = Request.Params.Get("prefix");

                    if (px == null) rbnTagX.Checked = true; else { txtIDX.Text = px; rbnIDX.Checked = true; }
                    if (py == null) rbnTagY.Checked = true; else { txtIDY.Text = py; rbnIDY.Checked = true; }

                    if (px != null)
                    {
                        if (config.tags.HasID(px))
                        {
                            rbnTagX.Checked = true;
                            lstTagX.SelectedValue = px;
                        }
                        else
                            lstTagX.SelectedValue = penultimate;
                    }
                    else
                        lstTagX.SelectedValue = penultimate;

                    if (py != null)
                    {
                        if (config.tags.HasID(py))
                        {
                            rbnTagY.Checked = true;
                            lstTagY.Items.FindByText(py.ToString());
                            lstTagY.SelectedValue = py.ToString();
                        }
                        else
                            lstTagY.SelectedValue = latest;                        
                    }
                    else
                        lstTagY.SelectedValue = latest;
                }

                JX = px != null ? px : rbnTagX.Checked ? lstTagX.SelectedValue : txtIDX.Text;
                JY = py != null ? py : rbnTagY.Checked ? lstTagY.SelectedValue : txtIDY.Text;

                Job jX = null, jY = null;

                try
                {
                    jX = new Job(config.datadir, (uint)Convert.ToInt32(JX), true);
                    jY = new Job(config.datadir, (uint)Convert.ToInt32(JY), true);
                }
                catch (Exception)
                {
                }

                txtIDX.Text = JX;
                txtIDY.Text = JY;

                cmp = new Comparison(jX, jY, Prefix.Replace('|', '\\'), config.tags);

                phPre.Controls.Add(buildHeader("CHART_PRE", ""));
                phChart.Controls.Add(buildChart());
                phHisto.Controls.Add(buildHistogramm());
                phMain.Controls.Add(buildTabPanels());
                //phMain.Controls.Add(buildFooter());
            }
            catch (Exception ex)
            {
                Label l = new Label();
                l.Text = "Error loading dataset: " + ex.Message;
                phMain.Controls.Add(l);
                l = new Label();
                l.Text = "Stacktrace: " + ex.StackTrace;
                phMain.Controls.Add(l);
            }
        }

        protected string selfLink(string prefix = null, int jobX = 0, int jobY = 0)
        {
            string res = Request.FilePath;
            Dictionary<string, string> p = new Dictionary<string, string>();
            p.Add("prefix", (prefix != null) ? prefix : Prefix);
            p.Add("jobX", (jobX != 0) ? jobX.ToString() : JX);
            p.Add("jobY", (jobY != 0) ? jobY.ToString() : JY);
            bool first = true;
            foreach (KeyValuePair<string, string> kvp in p)
            {
                if (first) res += "?"; else res += "&";
                res += kvp.Key + "=" + kvp.Value;
                first = false;
            }
            return res;
        }

        public Control buildFooter()
        {
            Panel p = new Panel();
            p.Style["text-align"] = "justify";

            Panel space = new Panel();
            space.Height = 15;
            p.Controls.Add(space);

            Label l = new Label();
            l.Text = "Subcategories: ";
            l.Font.Size = 8;
            l.Font.Name = "helvetica";
            l.ForeColor = Color.Black;
            p.Controls.Add(l);

            if (Prefix == "")
            {
                l = new Label();
                l.Text = "UP";
                l.Font.Size = 8;
                l.Font.Name = "helvetica";
                l.Font.Bold = true;
                l.ForeColor = Color.Gray;
                p.Controls.Add(l);
            }
            else
            {
                HyperLink h = new HyperLink();
                h.Text = "UP";
                int lio = Prefix.LastIndexOf("|");
                h.NavigateUrl = selfLink(lio == -1 ? "" : Prefix.Substring(0, lio));
                h.Style["text-decoration"] = "none";
                h.Font.Size = 8;
                h.Font.Name = "helvetica";
                h.ForeColor = Color.Green;
                p.Controls.Add(h);
            }

            foreach (KeyValuePair<string, ComparisonStatistics> kvp in cmp.Statistics.subdirs)
            {
                string postfix = kvp.Key;
                l = new Label();
                l.Text += "&nbsp;| ";
                p.Controls.Add(l);

                HyperLink h = new HyperLink();
                h.Text = postfix;
                h.NavigateUrl = selfLink((Prefix == "") ? postfix : Prefix + "|" + postfix);
                h.Style["text-decoration"] = "none";
                h.Font.Size = 8;
                h.Font.Name = "helvetica";
                p.Controls.Add(h);
            }

            return p;
        }

        public static System.Web.UI.WebControls.Image buildAlertImage(AlertLevel level)
        {
            System.Web.UI.WebControls.Image res = new System.Web.UI.WebControls.Image();

            switch (level)
            {
                case AlertLevel.None:
                    res.ImageUrl = "~/img/ok.png";
                    res.AlternateText = "OK";
                    break;
                case AlertLevel.Warning:
                    res.ImageUrl = "~/img/warning.png";
                    res.AlternateText = "Warning";
                    break;
                case AlertLevel.Critical:
                default:
                    res.ImageUrl = "~/img/critical.png";
                    res.AlternateText = "Critical";
                    break;
            }

            res.BorderWidth = 0;
            res.Style["vertical-align"] = "middle";

            return res;
        }

        protected class TabHeaderTemplate : ITemplate
        {
            AlertLevel _al = AlertLevel.None;
            public string _title = null;
            public string _toolTip = null;

            public TabHeaderTemplate(AlertLevel alertLevel, string title, string toolTip)
            {
                _al = alertLevel;
                _title = title;
                _toolTip = toolTip;
            }

            public void InstantiateIn(Control c)
            {
                c.Controls.Add(buildAlertImage(_al));
                Label l = new Label();
                l.Text = _title;
                l.ToolTip = _toolTip;
                l.Style["margin-left"] = "5px";
                c.Controls.Add(l);
            }
        }

        protected class TabContentTemplate : ITemplate
        {
            public TabContentTemplate()
            {
            }

            public void InstantiateIn(Control c)
            {
            }
        }

        protected TableRow buildStatisticsRow(string cat, double val1, double val2, string unit, double diff, string diffunit, Color posColor, Color negColor)
        {
            TableRow row = new TableRow();
            TableCell cell = new TableCell();
            cell.HorizontalAlign = HorizontalAlign.Left;
            cell.Text = cat;
            row.Cells.Add(cell);
            cell = new TableCell();
            cell.HorizontalAlign = HorizontalAlign.Right;
            cell.Text = val1.ToString("F3") + " " + unit;
            row.Cells.Add(cell);
            cell = new TableCell();
            cell.HorizontalAlign = HorizontalAlign.Right;
            cell.Text = val2.ToString("F3") + " " + unit;
            row.Cells.Add(cell);
            cell = new TableCell();
            cell.HorizontalAlign = HorizontalAlign.Right;
            cell.Text = (diff == 0.0 ? "&plusmn;" : (diff > 0.0) ? "+" : "") + diff.ToString("F3") + " " + diffunit;
            cell.ForeColor = (diff >= 0.0) ? posColor : negColor;
            row.Cells.Add(cell);
            return row;
        }

        protected Panel buildSummary()
        {
            ComparisonStatistics cs = cmp.Statistics;

            Panel p = new Panel();
            Table t = new Table();
            t.BorderWidth = 1;

            TableRow row = new TableRow();
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = "";
            thc.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.HorizontalAlign = HorizontalAlign.Center;
            thc.Text = cmp.ShortNameX;
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.HorizontalAlign = HorizontalAlign.Center;
            thc.Text = cmp.ShortNameY;
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.HorizontalAlign = HorizontalAlign.Center;
            thc.Text = "Relative";
            row.Cells.Add(thc);
            t.Rows.Add(row);

            row = new TableRow();
            TableCell tc = new TableCell();
            row.Cells.Add(tc);
            tc.Text = "Date";
            tc = new TableCell();
            tc.Text = cmp.DateX;
            row.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = cmp.DateY;
            row.Cells.Add(tc);
            tc = new TableCell();
            if (cmp.JobY != null && cmp.JobX != null)
                tc.Text = (cmp.JobY.MetaData.SubmissionTime - cmp.JobX.MetaData.SubmissionTime).ToString();
            row.Cells.Add(tc);
            t.Rows.Add(row);

            t.Rows.Add(buildStatisticsRow("Files:", cs.x_files, cs.y_files, "", 100.0 * ((cs.y_files / cs.x_files) - 1.0), "%", Color.Green, Color.Red));
            t.Rows.Add(buildStatisticsRow("Results:", cs.CountX, cs.CountY, "", 100.0 * ((cs.CountY / cs.CountX) - 1.0), "%", Color.Green, Color.Red));
            t.Rows.Add(buildStatisticsRow("Results (SAT):", cs.x_countSAT, cs.y_countSAT, "", 100.0 * ((cs.y_countSAT / cs.x_countSAT) - 1.0), "%", Color.Green, Color.Red));
            t.Rows.Add(buildStatisticsRow("Results (UNSAT):", cs.x_countUNSAT, cs.y_countUNSAT, "", 100.0 * ((cs.y_countUNSAT / cs.x_countUNSAT) - 1.0), "%", Color.Green, Color.Red));
            t.Rows.Add(buildStatisticsRow("Results (UNKNOWN):", cs.x_countUNKNOWN, cs.y_countUNKNOWN, "", 100.0 * ((cs.y_countUNKNOWN / cs.x_countUNKNOWN) - 1.0), "%", Color.Red, Color.Green));
            t.Rows.Add(buildStatisticsRow("Avg. Time/Result:", cs.TimeX / cs.CountX, cs.TimeY / cs.CountY, "sec.", 100.0 * (((cs.TimeY / cs.CountY) / (cs.TimeX / cs.CountX)) - 1.0), "%", Color.Red, Color.Green));
            t.Rows.Add(buildStatisticsRow("Avg. Time/Result (SAT):", cs.x_cumulativeTimeSAT / cs.x_countSAT, cs.y_cumulativeTimeSAT / cs.y_countSAT, "sec.", 100.0 * (((cs.y_cumulativeTimeSAT / cs.y_countSAT) / (cs.x_cumulativeTimeSAT / cs.x_countSAT)) - 1.0), "%", Color.Red, Color.Green));
            t.Rows.Add(buildStatisticsRow("Avg. Time/Result (UNSAT):", cs.x_cumulativeTimeUNSAT / cs.x_countUNSAT, cs.y_cumulativeTimeUNSAT / cs.y_countUNSAT, "sec.", 100.0 * (((cs.y_cumulativeTimeUNSAT / cs.y_countUNSAT) / (cs.x_cumulativeTimeUNSAT / cs.x_countUNSAT)) - 1.0), "%", Color.Red, Color.Green));
            t.Rows.Add(buildStatisticsRow("Avg. Time/Result (UNKNOWN):", cs.x_cumulativeTimeUNKNOWN / cs.x_countUNKNOWN, cs.y_cumulativeTimeUNKNOWN / cs.y_countUNKNOWN, "sec.", 100.0 * (((cs.y_cumulativeTimeUNKNOWN / cs.y_countUNKNOWN) / (cs.x_cumulativeTimeUNKNOWN / cs.x_countUNKNOWN)) - 1.0), "%", Color.Red, Color.Green));


            Table t2 = new Table();
            row = new TableRow();
            thc = new TableHeaderCell();
            thc.Text = "Statistic";
            thc.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.Text = "Value";
            thc.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(thc);
            t2.Rows.Add(row);

            row = new TableRow();
            tc = new TableCell();
            tc.Text = "Mean Delta";
            tc.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(tc);
            tc = new TableCell();
            tc.HorizontalAlign = HorizontalAlign.Right;
            tc.Text = cmp.Statistics.DeltaMean.ToString("F3");
            row.Cells.Add(tc);
            t2.Rows.Add(row);

            row = new TableRow();
            tc = new TableCell();
            tc.Text = "Dispersion Delta (Std. Dev.)";
            tc.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(tc);
            tc = new TableCell();
            tc.HorizontalAlign = HorizontalAlign.Right;
            tc.Text = cmp.Statistics.DeltaSTD.ToString("F3");
            row.Cells.Add(tc);
            t2.Rows.Add(row);

            row = new TableRow();
            tc = new TableCell();
            tc.Text = "Median Delta (P50)";
            tc.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(tc);
            tc = new TableCell();
            tc.HorizontalAlign = HorizontalAlign.Right;
            tc.Text = cmp.Statistics.DeltaP50.ToString("F3");
            row.Cells.Add(tc);
            t2.Rows.Add(row);

            row = new TableRow();
            tc = new TableCell();
            tc.Text = "[P1;P99]";
            tc.HorizontalAlign = HorizontalAlign.Left;
            row.Cells.Add(tc);
            tc = new TableCell();
            tc.HorizontalAlign = HorizontalAlign.Right;
            tc.Text = "[" + cmp.Statistics.DeltaP1.ToString("F2") + ";" + cmp.Statistics.DeltaP99.ToString("F2") + "]";
            row.Cells.Add(tc);
            t2.Rows.Add(row);

            Table bigtable = new Table();
            TableRow bigrow = new TableRow();
            TableCell bigcell = new TableCell();
            bigcell.HorizontalAlign = HorizontalAlign.Center;
            bigcell.Controls.Add(t);
            bigrow.Cells.Add(bigcell);
            bigcell = new TableCell();
            bigcell.HorizontalAlign = HorizontalAlign.Center;
            bigcell.Controls.Add(t2);
            bigrow.Cells.Add(bigcell);
            bigtable.Rows.Add(bigrow);
            p.Controls.Add(bigtable);
            return p;
        }

        protected Control buildTabPanels()
        {
            TabContainer tc = new TabContainer();
            tc.Height = 250;
            tc.ScrollBars = ScrollBars.Vertical;

            TabPanel tabStats = new TabPanel();
            tabStats.HeaderTemplate = new TabHeaderTemplate(AlertLevel.None, "Statistics", "Various statistical values.");
            tabStats.Controls.Add(buildSummary());
            tc.Tabs.Add(tabStats);

            tabStats = new TabPanel();
            tabStats.HeaderTemplate = new TabHeaderTemplate(AlertLevel.None, "Mean Happiness [Subdirs]", "A rating of the subdirectories by mean happiness.");
            tabStats.Controls.Add(buildMeanHappinessPanel());
            tc.Tabs.Add(tabStats);

            tabStats = new TabPanel();
            tabStats.HeaderTemplate = new TabHeaderTemplate(AlertLevel.None, "Mean Happiness [Top " + top_n + " Users]", "A rating of the users by mean happiness.");
            tabStats.Controls.Add(buildMeanHappinessPanelUsers(top_n));
            tc.Tabs.Add(tabStats);

            tabStats = new TabPanel();
            tabStats.HeaderTemplate = new TabHeaderTemplate(AlertLevel.None, "Dispersion Happiness [Subdirs]", "A rating of the subdirectories by dispersion happiness.");
            tabStats.Controls.Add(buildDispersionHappinessPanel());
            tc.Tabs.Add(tabStats);

            tabStats = new TabPanel();
            tabStats.HeaderTemplate = new TabHeaderTemplate(AlertLevel.None, "Dispersion Happiness [Top " + top_n + " Users]", "A rating of the users by dispersion happiness.");
            tabStats.Controls.Add(buildDispersionHappinessPanelUsers(top_n));
            tc.Tabs.Add(tabStats);

            return tc;
        }

        protected TableRow buildDispersionRow(string name, double value, double vs, Color good, Color bad)
        {
            TableRow r = new TableRow();
            TableCell c = new TableCell();

            Label l = new Label();
            l.Text = string.Format("<a href='" + selfLink(Prefix + (Prefix != "" ? "|" : "") + name.Replace('\\', '|')) + "' style='text-decoration:none;'>{0}</a>:", name);
            c.Controls.Add(l);
            r.Cells.Add(c);

            c = new TableCell();
            c.HorizontalAlign = HorizontalAlign.Right;
            l = new Label();
            l.Text = value.ToString("F3");
            l.ForeColor = Math.Abs(value) > vs ? bad : good;
            c.Controls.Add(l);
            r.Cells.Add(c);

            return r;
        }

        private int CompareSubdirsByDispersion(string x, string y)
        {
            ComparisonStatistics a = cmp.Statistics.subdirs[x];
            ComparisonStatistics b = cmp.Statistics.subdirs[y];
            if (Math.Abs(a.DeltaSTD) > Math.Abs(b.DeltaSTD))
                return -1;
            return 0;
        }

        protected Panel buildDispersionHappinessPanel()
        {
            ComparisonStatistics cs = cmp.Statistics;

            Panel p = new Panel();
            Table t = new Table();
            t.Enabled = true;
            t.BorderWidth = 1;

            TableRow row = new TableRow();
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = "Subdirectory";
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.Text = "Dispersion";
            row.Cells.Add(thc);
            t.Rows.Add(row);

            List<string> sds = new List<string>();
            foreach (KeyValuePair<string, ComparisonStatistics> kvp in cmp.Statistics.subdirs)
                sds.Add(kvp.Key);
            sds.Sort(CompareSubdirsByDispersion);

            double vs = 15;

            foreach (string s in sds)
                t.Rows.Add(buildDispersionRow(s, cmp.Statistics.subdirs[s].DeltaSTD, vs, Color.Green, Color.Red));

            p.Controls.Add(t);
            return p;
        }


        private int CompareSubdirsByPostfixDispersion(string x, string y)
        {
            ComparisonStatistics a = cmp.Statistics.postfixes[x];
            ComparisonStatistics b = cmp.Statistics.postfixes[y];
            if (Math.Abs(a.DeltaSTD) > Math.Abs(b.DeltaSTD))
                return -1;
            return 0;
        }

        protected Panel buildDispersionHappinessPanelUsers(uint n)
        {
            ComparisonStatistics cs = cmp.Statistics;

            Panel p = new Panel();
            Table t = new Table();
            t.Enabled = true;
            t.BorderWidth = 1;

            TableRow row = new TableRow();
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = "User";
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.Text = "Dispersion";
            row.Cells.Add(thc);
            t.Rows.Add(row);

            List<string> sds = new List<string>();
            foreach (KeyValuePair<string, ComparisonStatistics> kvp in cmp.Statistics.postfixes)
                sds.Add(kvp.Key);
            sds.Sort(CompareSubdirsByPostfixDispersion);

            double vs = 15;

            uint count = 0;
            foreach (string s in sds)
            {
                t.Rows.Add(buildDispersionRow(s, cmp.Statistics.postfixes[s].DeltaSTD, vs, Color.Green, Color.Red));
                if (++count == n) break;
            }

            p.Controls.Add(t);
            return p;
        }

        protected TableRow buildMeanRow(string name, double value, Color good, Color bad)
        {
            TableRow r = new TableRow();
            TableCell c = new TableCell();

            Label l = new Label();
            l.Text = string.Format("<a href='" + selfLink(Prefix + (Prefix != "" ? "|" : "") + name.Replace('\\', '|')) + "' style='text-decoration:none;'>{0}</a>:", name);
            c.Controls.Add(l);
            r.Cells.Add(c);

            c = new TableCell();
            c.HorizontalAlign = HorizontalAlign.Right;
            l = new Label();
            l.Text = value.ToString("F3");
            l.ForeColor = value < 0.0 ? bad : good;
            c.Controls.Add(l);
            r.Cells.Add(c);

            return r;
        }

        private int CompareSubdirsByMean(string x, string y)
        {
            ComparisonStatistics a = cmp.Statistics.subdirs[x];
            ComparisonStatistics b = cmp.Statistics.subdirs[y];
            if (a.DeltaMean < b.DeltaMean)
                return -1;
            else if (a.DeltaMean > b.DeltaMean)
                return +1;
            return 0;
        }

        protected Panel buildMeanHappinessPanel()
        {
            ComparisonStatistics cs = cmp.Statistics;

            Panel p = new Panel();
            Table t = new Table();
            t.Enabled = true;
            t.BorderWidth = 1;

            TableRow row = new TableRow();
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = "Subdirectory";
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.Text = "Mean";
            row.Cells.Add(thc);
            t.Rows.Add(row);

            List<string> sds = new List<string>();
            foreach (KeyValuePair<string, ComparisonStatistics> kvp in cmp.Statistics.subdirs)
                sds.Add(kvp.Key);
            sds.Sort(CompareSubdirsByMean);

            foreach (string s in sds)
                t.Rows.Add(buildMeanRow(s, cmp.Statistics.subdirs[s].DeltaMean, Color.Green, Color.Red));

            p.Controls.Add(t);
            return p;
        }


        private int CompareSubdirsByPostfixMean(string x, string y)
        {
            ComparisonStatistics a = cmp.Statistics.postfixes[x];
            ComparisonStatistics b = cmp.Statistics.postfixes[y];
            if (a.DeltaMean < b.DeltaMean)
                return -1;
            else if (a.DeltaMean > b.DeltaMean)
                return +1;
            return 0;
        }

        protected Panel buildMeanHappinessPanelUsers(uint n)
        {
            ComparisonStatistics cs = cmp.Statistics;

            Panel p = new Panel();
            Table t = new Table();
            t.Enabled = true;
            t.BorderWidth = 1;

            TableRow row = new TableRow();
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = "User";
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.Text = "Mean";
            row.Cells.Add(thc);
            t.Rows.Add(row);

            List<string> sds = new List<string>();
            foreach (KeyValuePair<string, ComparisonStatistics> kvp in cmp.Statistics.postfixes)
                sds.Add(kvp.Key);
            sds.Sort(CompareSubdirsByPostfixMean);

            uint count = 0;
            foreach (string s in sds)
            {
                t.Rows.Add(buildMeanRow(s, cmp.Statistics.postfixes[s].DeltaMean, Color.Green, Color.Red));
                if (++count == n) break;
            }

            p.Controls.Add(t);
            return p;
        }

        protected Control buildHeader(string tag, string summaryText)
        {
            Panel res = new Panel();

            Panel p = new Panel();
            p.ID = "Panel_" + tag + "_Header";
            p.CssClass = "collapsePanelHeader";
            p.Height = 30;
            p.BackColor = ColorTranslator.FromHtml("#88EEBB");

            Panel p1 = new Panel();
            p1.Style["padding"] = "5px";
            p1.Style["cursor"] = "pointer";
            p1.Style["vertical-align"] = "middle";

            System.Web.UI.WebControls.Image ib = new System.Web.UI.WebControls.Image();
            ib.Style["float"] = "left";
            ib.ImageUrl = "~/img/lookingglass.png";
            p1.Controls.Add(ib);

            Label l1 = new Label();
            l1.Style["float"] = "left";
            l1.Style["margin-left"] = "5px";
            l1.ForeColor = Color.Black;
            l1.Text = cmp.Title + "  \\" + Prefix.Replace('|', '\\');
            l1.Font.Bold = true;
            p1.Controls.Add(l1);

            System.Web.UI.WebControls.Image ai = buildAlertImage(AlertLevel.None);
            ai.Style["float"] = "right";
            p1.Controls.Add(ai);

            p.Controls.Add(p1);
            res.Controls.Add(p);

            p = new Panel();
            Label tl = new Label();
            tl.Text = summaryText;
            p.Controls.Add(tl);

            Panel space = new Panel();
            space.Height = 25;
            p.Controls.Add(space);

            res.Controls.Add(p);

            return res;
        }

        public Chart buildChart()
        {
            Chart chart = new Chart();

            Title ttle = new Title((Prefix == "") ? "Overall" : "\\" + Prefix.Replace('|', '\\'));
            ttle.Font = new Font(ttle.Font, FontStyle.Bold);
            chart.Titles.Add(ttle);

            chart.Height = 600;
            chart.Width = 525;

            ChartArea ca = new ChartArea("ScatterPlot");

            ca.AxisX.Minimum = 0.1;
            ca.AxisX.IsLogarithmic = true;
            ca.AxisX.LogarithmBase = 10;
            ca.AxisX.IsLabelAutoFit = true;
            ca.AxisX.LabelAutoFitStyle = LabelAutoFitStyles.None;
            ca.AxisX.LabelAutoFitMinFontSize = 8;
            ca.AxisX.LabelAutoFitMaxFontSize = 8;
            ca.AxisX.MajorGrid.LineDashStyle = ChartDashStyle.Dash;

            ca.AxisY.Minimum = 0.1;
            ca.AxisY.IsLogarithmic = true;
            ca.AxisY.LogarithmBase = 10;
            ca.AxisY.IsLabelAutoFit = true;
            ca.AxisY.LabelAutoFitStyle = LabelAutoFitStyles.None;
            ca.AxisY.LabelAutoFitMinFontSize = 8;
            ca.AxisY.LabelAutoFitMaxFontSize = 8;
            ca.AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;

            chart.ChartAreas.Add(ca);

            if (!cmp.HasJobs)
            {
                ca.AxisX.Maximum = 10000;
                ca.AxisY.Maximum = 10000;

                ca.AxisX.Title = cmp.NameX;
                ca.AxisY.Title = cmp.NameY;

                Series ser = new Series("Dummy");
                ser.ChartArea = ca.Name;
                ser.ChartType = SeriesChartType.Point;
                ser.Color = Color.Blue;
                ser.MarkerSize = 2;
                ser.MarkerStyle = MarkerStyle.Cross;
                ser.IsVisibleInLegend = false;
                ser.Points.AddXY(1, 1);
                chart.Series.Add(ser);
            }
            else
            {
                Legend lgnd = new Legend();
                lgnd.Docking = Docking.Top;
                lgnd.IsDockedInsideChartArea = false;
                lgnd.Alignment = StringAlignment.Center;
                lgnd.DockedToChartArea = ca.Name;
                lgnd.Name = "StatisticsLegend";
                chart.Legends.Add(lgnd);

                ca.AxisX.Title = cmp.NameX;
                ca.AxisY.Title = cmp.NameY;

                ca.AxisX.Minimum = cmp.MinX;
                ca.AxisY.Minimum = cmp.MinY;
                ca.AxisX.Maximum = cmp.MaxX;
                ca.AxisY.Maximum = cmp.MaxY;

                ca.AxisX.CustomLabels.Add(new CustomLabel(Math.Log10(cmp.TimeOutX) - 0.2, Math.Log10(cmp.TimeOutX) + 0.2, "", 0, LabelMarkStyle.None, GridTickTypes.None));
                ca.AxisX.CustomLabels.Add(new CustomLabel(Math.Log10(cmp.MemOutX) - 0.2, Math.Log10(cmp.MemOutX) + 0.2, "M", 0, LabelMarkStyle.SideMark, GridTickTypes.None));
                ca.AxisX.CustomLabels.Add(new CustomLabel(Math.Log10(cmp.ErrorX) - 0.2, Math.Log10(cmp.ErrorX) + 0.2, "E", 0, LabelMarkStyle.SideMark, GridTickTypes.None));
                ca.AxisY.CustomLabels.Add(new CustomLabel(Math.Log10(cmp.TimeOutY) - 0.2, Math.Log10(cmp.TimeOutY) + 0.2, "", 0, LabelMarkStyle.None, GridTickTypes.None));
                ca.AxisY.CustomLabels.Add(new CustomLabel(Math.Log10(cmp.MemOutY) - 0.2, Math.Log10(cmp.MemOutY) + 0.2, "M", 0, LabelMarkStyle.SideMark, GridTickTypes.None));
                ca.AxisY.CustomLabels.Add(new CustomLabel(Math.Log10(cmp.ErrorY) - 0.2, Math.Log10(cmp.ErrorY) + 0.2, "E", 0, LabelMarkStyle.SideMark, GridTickTypes.None));

                ca.AxisX.CustomLabels.Add(new CustomLabel(-1.2, -0.8, "0.1", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
                ca.AxisX.CustomLabels.Add(new CustomLabel(-0.1, 0.105, "1", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisX.CustomLabels.Add(new CustomLabel(0.9, 1.1, "10", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisX.CustomLabels.Add(new CustomLabel(1.8, 2.2, "100", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisX.CustomLabels.Add(new CustomLabel(2.8, 3.2, "1K", 0, LabelMarkStyle.SideMark, GridTickTypes.All));

                ca.AxisY.CustomLabels.Add(new CustomLabel(-1.2, -0.8, "0.1", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
                ca.AxisY.CustomLabels.Add(new CustomLabel(-0.1, 0.105, "1", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisY.CustomLabels.Add(new CustomLabel(0.9, 1.1, "10", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisY.CustomLabels.Add(new CustomLabel(1.8, 2.2, "100", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisY.CustomLabels.Add(new CustomLabel(2.8, 3.2, "1K", 0, LabelMarkStyle.SideMark, GridTickTypes.All));

                Series serTimeout = new Series("Timeouts");
                serTimeout.ChartArea = ca.Name;
                serTimeout.ChartType = SeriesChartType.FastLine;
                serTimeout.Color = Color.Black;
                serTimeout.Points.AddXY(ca.AxisX.Minimum, cmp.TimeOutY);
                serTimeout.Points.AddXY(cmp.TimeOutX, cmp.TimeOutY);
                serTimeout.Points.AddXY(cmp.TimeOutX, ca.AxisY.Minimum);
                serTimeout.IsVisibleInLegend = false;
                chart.Series.Add(serTimeout);

                Series serMemout = new Series("Memouts");
                serMemout.ChartArea = ca.Name;
                serMemout.ChartType = SeriesChartType.FastLine;
                serMemout.Color = Color.Orange;
                serMemout.Points.AddXY(ca.AxisX.Minimum, cmp.MemOutY);
                serMemout.Points.AddXY(cmp.MemOutX, cmp.MemOutY);
                serMemout.Points.AddXY(cmp.MemOutX, ca.AxisY.Minimum);
                serMemout.IsVisibleInLegend = false;
                chart.Series.Add(serMemout);

                Series serErrors = new Series("Errors");
                serErrors.ChartArea = ca.Name;
                serErrors.ChartType = SeriesChartType.FastLine;
                serErrors.Color = Color.Red;
                serErrors.Points.AddXY(ca.AxisX.Minimum, cmp.ErrorY);
                serErrors.Points.AddXY(cmp.ErrorX, cmp.ErrorY);
                serErrors.Points.AddXY(cmp.ErrorX, ca.AxisY.Minimum);
                serErrors.IsVisibleInLegend = false;
                chart.Series.Add(serErrors);

                Series serDiag = new Series("Diagonal");
                serDiag.ChartArea = ca.Name;
                serDiag.ChartType = SeriesChartType.FastLine;
                serDiag.Color = Color.Black;
                serDiag.Points.AddXY(ca.AxisX.Minimum, ca.AxisY.Minimum);
                serDiag.Points.AddXY(cmp.ErrorX, cmp.ErrorY);
                serDiag.IsVisibleInLegend = false;
                chart.Series.Add(serDiag);

                Series ser = new Series("Equal outcome");
                ser.ChartArea = ca.Name;
                ser.ChartType = SeriesChartType.Point;
                ser.Color = Color.Blue;
                ser.MarkerSize = 5;
                ser.MarkerStyle = MarkerStyle.Cross;
                ser.MarkerBorderWidth = 0;

                Series serBetter = new Series("Better outcome");
                serBetter.ChartArea = ca.Name;
                serBetter.ChartType = SeriesChartType.Point;
                serBetter.Color = Color.Green;
                serBetter.MarkerSize = 5;
                serBetter.MarkerStyle = MarkerStyle.Cross;
                serBetter.MarkerBorderWidth = 0;

                Series serWorse = new Series("Worse outcome");
                serWorse.ChartArea = ca.Name;
                serWorse.ChartType = SeriesChartType.Point;
                serWorse.Color = Color.Red;
                serWorse.MarkerSize = 5;
                serWorse.MarkerStyle = MarkerStyle.Cross;
                serWorse.MarkerBorderWidth = 0;

                foreach (Comparison.Point p in cmp.Datapoints)
                {
                    switch (p.type)
                    {
                        case Comparison.PointType.BETTER: serBetter.Points.AddXY(p.x, p.y); ; break;
                        case Comparison.PointType.WORSE: serWorse.Points.AddXY(p.x, p.y); ; break;
                        default: ser.Points.AddXY(p.x, p.y); break;
                    }

                    // if (p.tooltip != null && p.tooltip != "") ser.Points.Last().ToolTip = p.tooltip;
                }

                chart.Series.Add(ser);
                chart.Series.Add(serBetter);
                chart.Series.Add(serWorse);
            }

            return chart;
        }

        protected Chart buildHistogramm()
        {
            Chart chart = new Chart();

            Title ttle = new Title("Dispersion Analysis");
            ttle.Font = new Font(ttle.Font, FontStyle.Bold);
            chart.Titles.Add(ttle);

            chart.Height = 400;
            chart.Width = 450;

            ChartArea ca = new ChartArea("Histogramm");

            ca.AxisX.LabelAutoFitStyle = LabelAutoFitStyles.LabelsAngleStep30;
            ca.AxisX.IsLabelAutoFit = true;
            ca.AxisX.LabelAutoFitMinFontSize = 8;
            ca.AxisX.LabelAutoFitMaxFontSize = 8;
            ca.AxisX.MajorGrid.Enabled = false;
            ca.AxisX.Minimum = -0.5;
            ca.AxisX.Maximum = 10.5;

            ca.AxisY.IsLogarithmic = true;
            ca.AxisY.LogarithmBase = 10;
            ca.AxisY.Minimum = 1;
            ca.AxisY.LabelAutoFitMinFontSize = 8;
            ca.AxisY.LabelAutoFitMaxFontSize = 8;
            ca.AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;

            ca.AxisX.CustomLabels.Add(new CustomLabel(-0.5, 0.5, "Lost", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(0.5, 1.5, "[>-T;-500]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(1.5, 2.5, "[-500;-50]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(2.5, 3.5, "[-50;-5]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(3.5, 4.5, "[-5;-1]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(4.5, 5.5, "[-.5;+.5]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(5.5, 6.5, "[+1;+5]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(6.5, 7.5, "[+5;+50]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(7.5, 8.5, "[+50;+500]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(8.5, 9.5, "[+500;+T]", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));
            ca.AxisX.CustomLabels.Add(new CustomLabel(9.5, 10.5, "Gained", 0, LabelMarkStyle.SideMark, GridTickTypes.TickMark));

            chart.ChartAreas.Add(ca);

            Legend lgnd = new Legend();
            lgnd.Docking = Docking.Top;
            lgnd.IsDockedInsideChartArea = false;
            lgnd.Alignment = StringAlignment.Center;
            lgnd.DockedToChartArea = ca.Name;
            lgnd.Name = "StatisticsLegend";
            lgnd.Font = new Font(lgnd.Font.FontFamily, 8, lgnd.Font.Style, GraphicsUnit.Point);
            chart.Legends.Add(lgnd);

            Series ser = new Series("Dispersion");
            ser.ChartArea = ca.Name;
            ser.ChartType = SeriesChartType.Column;
            ser.IsVisibleInLegend = false;

            Series serCumulative = new Series("Cumulative");
            serCumulative.ChartArea = ca.Name;
            serCumulative.ChartType = SeriesChartType.Spline;
            serCumulative.Color = Color.Blue;
            serCumulative["LineTension"] = "0.05";
            serCumulative.IsVisibleInLegend = true;

            serCumulative.Points.AddXY(-0.5, 0);

            uint cumCount = 0;

            if (!cmp.HasJobs)
            {
                for (uint i = 0; i < 9; i++)
                    ser.Points.Add(1);
            }
            else
            {
                List<uint> hg = cmp.Histogramm;
                uint column = 0;

                foreach (uint p in hg)
                {
                    ser.Points.AddXY(column, p == 0 ? 1 : p);
                    double prog = column / (double)hg.Count;
                    ser.Points.Last().Color = Color.FromArgb((int)(255 * (1.0 - prog)), (int)(255 * prog), 0);

                    cumCount += p;
                    serCumulative.Points.AddXY(column, cumCount);
                    column++;
                }
            }

            chart.Series.Add(ser);
            chart.Series.Add(serCumulative);


            if (cumCount > 0)
            {
                Series serCD = new Series("Typical");
                serCD.ChartArea = ca.Name;
                serCD.ChartType = SeriesChartType.Spline;
                serCD.Color = Color.Gray;
                serCD.BorderDashStyle = ChartDashStyle.Dash;
                serCD.IsVisibleInLegend = true;

                serCD["LineTension"] = "0.05";

                // CMW: The numbers here are from reference comparison #1598/#1599
                // and they are supposed to represent typical cluster dispersion
                // (without any changes to the binary). This data may be wrong.
                serCD.Points.AddXY(0.0, (2.0 / 101663) * cumCount);
                serCD.Points.AddXY(1.0, (2.0 / 101663) * cumCount);
                serCD.Points.AddXY(2.0, (20.0 / 101663) * cumCount);
                serCD.Points.AddXY(3.0, (250.0 / 101663) * cumCount);
                serCD.Points.AddXY(4.0, (1000.0 / 101663) * cumCount);
                serCD.Points.AddXY(5.0, (100000.0 / 101663) * cumCount);
                serCD.Points.AddXY(6.0, (1000.0 / 101663) * cumCount);
                serCD.Points.AddXY(7.0, (250.0 / 101663) * cumCount);
                serCD.Points.AddXY(8.0, (20.0 / 101663) * cumCount);
                serCD.Points.AddXY(9.0, (2.0 / 101663) * cumCount);
                serCD.Points.AddXY(10.0, (2.0 / 101663) * cumCount);

                chart.Series.Add(serCD);


                Series serSTD = new Series("Std. Dev.");
                serSTD.ChartArea = ca.Name;
                serSTD.ChartType = SeriesChartType.Line;
                serSTD.MarkerSize = 5;
                serSTD.MarkerStyle = MarkerStyle.Diamond;
                serSTD.Color = Color.Purple;
                serSTD.IsVisibleInLegend = true;

                double mean = cmp.Statistics.DeltaMean;
                double mean_log = Math.Abs(mean) < 0.1 ? 0.0 : Math.Sign(mean) * Math.Log10(Math.Abs(10 * mean)) / Math.Log10(10);

                double std = cmp.Statistics.DeltaSTD;
                double std_1_log = Math.Abs(std) < 0.1 ? 0.0 : Math.Sign(std) * Math.Log10(Math.Abs(10 * std)) / Math.Log10(10);
                double std_2_log = Math.Abs(std * 2.0) < 0.1 ? 0.0 : Math.Sign(std) * Math.Log10(Math.Abs(20 * std)) / Math.Log10(10);
                double std_3_log = Math.Abs(std * 3.0) < 0.1 ? 0.0 : Math.Sign(std) * Math.Log10(Math.Abs(30 * std)) / Math.Log10(10);

                serSTD.Points.AddXY(5.0 + mean_log - std_3_log, cumCount * 2);
                serSTD.Points.Last().ToolTip = "-3 Std. Dev.";
                serSTD.Points.Last().Label = "-3\u03C3";
                serSTD.Points.AddXY(5.0 + mean_log - std_2_log, cumCount * 2);
                serSTD.Points.Last().ToolTip = "-2 Std. Dev.";
                serSTD.Points.AddXY(5.0 + mean_log - std_1_log, cumCount * 2);
                serSTD.Points.Last().ToolTip = "-1 Std. Dev.";
                serSTD.Points.Last().Label = "-\u03C3";
                serSTD.Points.AddXY(5.0 + mean_log, cumCount * 2);
                serSTD.Points.Last().ToolTip = "Mean";
                serSTD.Points.AddXY(5.0 + mean_log + std_1_log, cumCount * 2);
                serSTD.Points.Last().ToolTip = "+1 Std. Dev.";
                serSTD.Points.Last().Label = "+\u03C3";
                serSTD.Points.AddXY(5.0 + mean_log + std_2_log, cumCount * 2);
                serSTD.Points.Last().ToolTip = "+2 Std. Dev.";
                serSTD.Points.AddXY(5.0 + mean_log + std_3_log, cumCount * 2);
                serSTD.Points.Last().ToolTip = "+3 Std. Dev.";
                serSTD.Points.Last().Label = "+3\u03C3";
                serSTD.SmartLabelStyle.Enabled = true;
                serSTD.SmartLabelStyle.IsMarkerOverlappingAllowed = true;
                serSTD.SmartLabelStyle.IsOverlappedHidden = true;
                serSTD.SmartLabelStyle.MovingDirection = LabelAlignmentStyles.Bottom;
                serSTD.Font = new Font(serSTD.Font.FontFamily, 6);

                chart.Series.Add(serSTD);

                Series serPs = new Series("Percentiles");
                serPs.ChartArea = ca.Name;
                serPs.ChartType = SeriesChartType.Line;
                serPs.MarkerSize = 5;
                serPs.MarkerStyle = MarkerStyle.Diamond;
                serPs.Color = Color.Violet;
                serPs.IsVisibleInLegend = true;
                serPs.Font = new Font(serSTD.Font.FontFamily, 6);

                double p1 = cmp.Statistics.DeltaP(1);
                double p25 = cmp.Statistics.DeltaP(25);
                double p50 = cmp.Statistics.DeltaP(50);
                double p75 = cmp.Statistics.DeltaP(75);
                double p99 = cmp.Statistics.DeltaP(99);

                double p1_log = Math.Abs(p1) < 0.1 ? 0.0 : Math.Sign(p1) * Math.Log10(Math.Abs(10 * p1)) / Math.Log10(10);
                double p25_log = Math.Abs(p25) < 0.1 ? 0.0 : Math.Sign(p25) * Math.Log10(Math.Abs(10 * p25)) / Math.Log10(10);
                double p50_log = Math.Abs(p50) < 0.1 ? 0.0 : Math.Sign(p50) * Math.Log10(Math.Abs(10 * p50)) / Math.Log10(10);
                double p75_log = Math.Abs(p75) < 0.1 ? 0.0 : Math.Sign(p75) * Math.Log10(Math.Abs(10 * p75)) / Math.Log10(10);
                double p99_log = Math.Abs(p99) < 0.1 ? 0.0 : Math.Sign(p99) * Math.Log10(Math.Abs(10 * p99)) / Math.Log10(10);

                serPs.Points.AddXY(5.0 + p1_log, cumCount * 8);
                serPs.Points.Last().ToolTip = "P1";
                serPs.Points.Last().Label = "P1";
                serPs.Points.AddXY(5.0 + p25_log, cumCount * 8);
                serPs.Points.Last().ToolTip = "P25";
                serPs.Points.AddXY(5.0 + p50_log, cumCount * 8);
                serPs.Points.Last().ToolTip = "P50";
                serPs.Points.Last().Label = "P50";
                serPs.Points.AddXY(5.0 + p75_log, cumCount * 8);
                serPs.Points.Last().ToolTip = "P75";
                serPs.Points.AddXY(5.0 + p99_log, cumCount * 8);
                serPs.Points.Last().ToolTip = "P99";
                serPs.Points.Last().Label = "P99";
                serPs.SmartLabelStyle.Enabled = true;
                serPs.SmartLabelStyle.IsMarkerOverlappingAllowed = true;
                serPs.SmartLabelStyle.IsOverlappedHidden = true;
                serPs.SmartLabelStyle.MovingDirection = LabelAlignmentStyles.Bottom;

                chart.Series.Add(serPs);
            }

            return chart;
        }

        protected void btnCSV_Click(object sender, EventArgs e)
        {
            string filename = JX + "_vs_" + JY;
            if (Prefix != "") filename += " " + Prefix.Replace('\\', '|');
            filename += ".csv";

            Response.ContentType = "text/csv";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);

            Response.Write("File,[" + JX + "],[" + JY + "],Dispersion" + Environment.NewLine);

            foreach (Comparison.Point q in cmp.Datapoints)
            {
                string r = q.tooltip + ",";
                r += (q.x == cmp.TimeOutX) ? "TIME" : (q.x == cmp.MemOutX) ? "MEMORY" : (q.x == cmp.ErrorX) ? "ERROR" : q.x.ToString();
                r += ",";
                r += (q.y == cmp.TimeOutY) ? "TIME" : (q.y == cmp.MemOutY) ? "MEMORY" : (q.y == cmp.ErrorY) ? "ERROR" : q.y.ToString();
                r += ",";

                if (q.x >= cmp.TimeOutX && q.y >= cmp.TimeOutY)
                {
                    r += "0,";
                }
                else if (q.x < cmp.TimeOutX && q.y < cmp.TimeOutY)
                {
                    r += (q.x - q.y).ToString() + ",";
                }
                else if (q.x < cmp.TimeOutX && q.y >= cmp.TimeOutY)
                {
                    r += (-cmp.TimeOutY).ToString() + ",";
                }
                else
                {
                    r += (cmp.TimeOutX).ToString() + ",";
                }

                Response.Write(r + Environment.NewLine);
            }

            Response.End();
        }
    }
}