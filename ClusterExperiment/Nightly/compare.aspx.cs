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
        Dictionary<string, string> _defaultParams = null;
        public DateTime _startTime = DateTime.Now;
        string _prefix = null;
        Comparison cmp = null;
        JobSelect js = null;

        public TimeSpan RenderTime
        {
            get { return DateTime.Now - _startTime; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                config = Application["Configuration"] as Configuration;
                js = (JobSelect)LoadControl("JobSelect.ascx");

                foreach (KeyValuePair<string, uint> kvp in config.Tags)
                {
                    ListItem li = new ListItem(kvp.Key, kvp.Value.ToString());
                    js.TaglistX.Items.Add(li);
                    js.TaglistY.Items.Add(li);
                }

                try
                {
                    _defaultParams = new Dictionary<string, string>();
                    _prefix = Request.Params.Get("prefix");
                    if (_prefix == null) _prefix = "";

                    string j1 = Request.Params.Get("jobX");
                    string j2 = Request.Params.Get("jobY");

                    j1 = "1693";
                    j2 = "1812";

                    string maxm1 = (int.MaxValue - 1).ToString();
                    string max = int.MaxValue.ToString();

                    if (j1 == null) j1 = maxm1;
                    if (j2 == null) j2 = max;

                    if ((j1 == maxm1 || j1 == max) || (j2 == maxm1 || j2 == max))
                    {
                        Timeline tl = new Timeline(Server.MapPath("~"), config.DATADIR, config.TIMELINEFILE);
                        DataRowCollection rows = tl.Tables[0].Rows;

                        if (j1 == maxm1)
                            j1 = rows[rows.Count - 2]["ID"].ToString();
                        if (j1 == max)
                            j1 = rows[rows.Count - 1]["ID"].ToString();

                        if (j2 == maxm1)
                            j2 = rows[rows.Count - 2]["ID"].ToString();
                        if (j2 == max)
                            j2 = rows[rows.Count - 1]["ID"].ToString();

                        config.Tags.Insert("Penultimate", Convert.ToUInt32(j1));
                        config.Tags.Insert("Latest", Convert.ToUInt32(j2));
                    }

                    _defaultParams.Add("jobX", j1);
                    _defaultParams.Add("jobY", j2);


                    Job jX = null, jY = null;

                    try
                    {
                        jX = new Job(config.DATADIR, (uint)Convert.ToInt32(j1), true);
                        jY = new Job(config.DATADIR, (uint)Convert.ToInt32(j2), true);
                    }
                    catch (Exception)
                    {
                    }

                    js.TaglistX.ClearSelection();
                    js.TaglistY.ClearSelection();

                    if (jX != null && config.Tags.HasTag(jX.MetaData.Id))
                    {
                        js.TaglistX.SelectedValue = jX.MetaData.Id.ToString();
                        js.CheckTagX();
                    }
                    else
                    {
                        js.TaglistX.SelectedIndex = 0;
                        js.CheckIDX();
                    }

                    if (jY != null && config.Tags.HasTag(jY.MetaData.Id))
                    {
                        js.TaglistY.SelectedValue = jY.MetaData.Id.ToString();
                        js.CheckTagY();
                    }
                    else
                    {
                        js.TaglistY.SelectedIndex = 0;
                        js.CheckIDY();
                    }

                    js.IDX = j1;
                    js.IDY = j2;

                    cmp = new Comparison(jX, jY, _prefix.Replace('|', '\\'), config.Tags);

                    phMain.Controls.Add(buildChartPanel(false, "CHART", ""));
                    phMain.Controls.Add(buildSummaryPanel());
                    phMain.Controls.Add(buildFooter());
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
        }

        protected string selfLink(string prefix = null, int jobX = 0, int jobY = 0)
        {
            string res = Request.FilePath;
            Dictionary<string, string> p = new Dictionary<string, string>();
            p.Add("prefix", (prefix != null) ? prefix : _defaultParams["prefix"]);
            p.Add("jobX", (jobX != 0) ? jobX.ToString() : _defaultParams["jobX"]);
            p.Add("jobY", (jobY != 0) ? jobY.ToString() : _defaultParams["jobY"]);
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
            Panel space = new Panel();
            space.Height = 15;
            phMain.Controls.Add(space);

            Panel p = new Panel();
            p.Style["text-align"] = "justify";

            Label l = new Label();
            l.Text = "Subcategories: ";
            l.Font.Size = 8;
            l.Font.Name = "helvetica";
            l.ForeColor = Color.Black;
            p.Controls.Add(l);

            if (_prefix == "")
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
                int lio = _prefix.LastIndexOf("|");
                h.NavigateUrl = selfLink(lio == -1 ? "" : _prefix.Substring(0, lio));
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
                h.NavigateUrl = selfLink((_prefix == "") ? postfix : _prefix + "|" + postfix);
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
            List<string> _files = null;

            public TabContentTemplate(List<string> files)
            {
                _files = files;
            }

            public void InstantiateIn(Control c)
            {
            }
        }

        TableRow buildStatisticsRow(string cat, double val1, double val2, string unit, double diff, string diffunit, Color posColor, Color negColor)
        {
            TableRow row = new TableRow();
            TableCell cell = new TableCell();
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

        protected Control buildSummary()
        {
            ComparisonStatistics cs = cmp.Statistics;

            Panel p = new Panel();
            Table t = new Table();
            t.BorderWidth = 1;

            TableRow row = new TableRow();
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = "";
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.Text = cmp.ShortNameX;
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
            thc.Text = cmp.ShortNameY;
            row.Cells.Add(thc);
            thc = new TableHeaderCell();
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

            t.Rows.Add(buildStatisticsRow("Results:", cs.CountX, cs.CountY, "", 100.0 * ((cs.CountY / cs.CountX) - 1.0), "%", Color.Green, Color.Red));
            t.Rows.Add(buildStatisticsRow("Results (SAT):", cs.x_countSAT, cs.y_countSAT, "", 100.0 * ((cs.y_countSAT / cs.x_countSAT) - 1.0), "%", Color.Green, Color.Red));
            t.Rows.Add(buildStatisticsRow("Results (UNSAT):", cs.x_countUNSAT, cs.y_countUNSAT, "", 100.0 * ((cs.y_countUNSAT / cs.x_countUNSAT) - 1.0), "%", Color.Green, Color.Red));
            t.Rows.Add(buildStatisticsRow("Results (UNKNOWN):", cs.x_countUNKNOWN, cs.y_countUNKNOWN, "", 100.0 * ((cs.y_countUNKNOWN / cs.x_countUNKNOWN) - 1.0), "%", Color.Red, Color.Green));
            t.Rows.Add(buildStatisticsRow("Avg. Time/Result:", cs.TimeX / cs.CountX, cs.TimeY / cs.CountY, "sec.", 100.0 * (((cs.TimeY / cs.CountY) / (cs.TimeX / cs.CountX)) - 1.0), "%", Color.Red, Color.Green));
            t.Rows.Add(buildStatisticsRow("Avg. Time/Result (SAT):", cs.x_cumulativeTimeSAT / cs.x_countSAT, cs.y_cumulativeTimeSAT / cs.y_countSAT, "sec.", 100.0 * (((cs.y_cumulativeTimeSAT / cs.y_countSAT) / (cs.x_cumulativeTimeSAT / cs.x_countSAT)) - 1.0), "%", Color.Red, Color.Green));
            t.Rows.Add(buildStatisticsRow("Avg. Time/Result (UNSAT):", cs.x_cumulativeTimeUNSAT / cs.x_countUNSAT, cs.y_cumulativeTimeUNSAT / cs.y_countUNSAT, "sec.", 100.0 * (((cs.y_cumulativeTimeUNSAT / cs.y_countUNSAT) / (cs.x_cumulativeTimeUNSAT / cs.x_countUNSAT)) - 1.0), "%", Color.Red, Color.Green));
            t.Rows.Add(buildStatisticsRow("Avg. Time/Result (UNKNOWN):", cs.x_cumulativeTimeUNKNOWN / cs.x_countUNKNOWN, cs.y_cumulativeTimeUNKNOWN / cs.y_countUNKNOWN, "sec.", 100.0 * (((cs.y_cumulativeTimeUNKNOWN / cs.y_countUNKNOWN) / (cs.x_cumulativeTimeUNKNOWN / cs.x_countUNKNOWN)) - 1.0), "%", Color.Red, Color.Green));

            p.Controls.Add(t);
            return p;
        }

        protected Control buildSummaryPanel()
        {
            TabContainer tc = new TabContainer();
            tc.Height = 200;
            tc.ScrollBars = ScrollBars.Vertical;

            TabPanel tabStats = new TabPanel();
            tabStats.HeaderTemplate = new TabHeaderTemplate(AlertLevel.None, "Statistics", "Various statistical values.");
            tabStats.ContentTemplate = new TabContentTemplate(new List<string>());
            tabStats.Controls.Add(buildSummary());
            tc.Tabs.Add(tabStats);

            return tc;
        }

        protected Control buildChartPanel(bool collapsible, string tag, string summaryText, bool collapsed = false)
        {
            Panel p = new Panel();
            p.ID = "Panel_" + tag + "_Header";
            p.CssClass = "collapsePanelHeader";
            p.Height = 30;
            p.BackColor = ColorTranslator.FromHtml("#88EEBB");


            Panel p1 = new Panel();
            p1.Style["padding"] = "5px";
            p1.Style["cursor"] = "pointer";
            p1.Style["vertical-align"] = "middle";

            if (collapsible)
            {
                ImageButton ib = new ImageButton();
                ib.Style["float"] = "left";
                ib.ID = "I_" + tag;
                ib.ImageUrl = "~/img/expand_blue.jpg";
                ib.AlternateText = "(...)";
                p1.Controls.Add(ib);

                Label l2 = new Label();
                l2.ID = "L_" + tag;
                l2.Style["float"] = "left";
                l2.Style["margin-left"] = "5px";
                p1.Controls.Add(l2);
            }
            else
            {
                System.Web.UI.WebControls.Image ib = new System.Web.UI.WebControls.Image();
                ib.Style["float"] = "left";
                ib.ImageUrl = "~/img/lookingglass.png";
                p1.Controls.Add(ib);
            }

            Label l1 = new Label();
            l1.Style["float"] = "left";
            l1.Style["margin-left"] = "5px";
            l1.ForeColor = Color.Black;
            l1.Text = cmp.Title + "  \\" + _prefix.Replace('|', '\\');
            l1.Font.Bold = true;
            p1.Controls.Add(l1);

            System.Web.UI.WebControls.Image ai = buildAlertImage(AlertLevel.None);
            ai.Style["float"] = "right";
            p1.Controls.Add(ai);

            p.Controls.Add(p1);
            phMain.Controls.Add(p);


            p = new Panel();
            p.ID = "Panel_" + tag + "_Content";
            p.CssClass = "collapsePanel";
            p.Height = 0;

            Table t = new Table();
            t.Style["border-width"] = "0px";

            TableRow r = new TableRow();
            TableCell tc = new TableCell();

            Label tl = new Label();
            tl.Text = summaryText;
            tc.Controls.Add(tl);
            r.Cells.Add(tc);

            tc = new TableCell();
            r.Cells.Add(tc);
            t.Rows.Add(r);

            r = new TableRow();
            tc = new TableCell();
            tc.Controls.Add(buildChart());
            r.Cells.Add(tc);

            tc = new TableCell();
            Panel space = new Panel();
            space.Height = 25;
            tc.Controls.Add(space);
            tc.Controls.Add(js);
            tc.VerticalAlign = VerticalAlign.Top;
            r.Cells.Add(tc);

            t.Rows.Add(r);
            p.Controls.Add(t);
            phMain.Controls.Add(p);


            space = new Panel();
            space.Height = 15;
            phMain.Controls.Add(space);


            CollapsiblePanelExtender cep = new CollapsiblePanelExtender();

            cep.ID = tag + "_CPE";
            cep.TargetControlID = "Panel_" + tag + "_Content";
            cep.SuppressPostBack = true;
            cep.Collapsed = collapsible && collapsed;
            if (collapsible)
            {
                cep.ExpandControlID = "Panel_" + tag + "_Header";
                cep.CollapseControlID = "Panel_" + tag + "_Header";
                cep.TextLabelID = "L_" + tag;
                cep.ImageControlID = "I_" + tag;
                cep.ExpandedImage = "~/img/collapse_blue.jpg";
                cep.CollapsedImage = "~/img/expand_blue.jpg";
                cep.CollapsedText = "[+]";
                cep.ExpandedText = "[-]";
            }

            return cep;
        }

        public Chart buildChart()
        {
            Chart chart = new Chart();

            Title ttle = new Title((_prefix == "") ? "Overall" : "\\" + _prefix.Replace('|', '\\'));
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

            // ca.Position.Height = 25;
            // ca.Position.Width = 85;
            // ca.Position.Auto = true;

            chart.ChartAreas.Add(ca);

            Legend lgnd = new Legend();
            lgnd.Docking = Docking.Top;
            lgnd.IsDockedInsideChartArea = false;
            lgnd.Alignment = StringAlignment.Center;
            lgnd.DockedToChartArea = ca.Name;
            lgnd.Name = "StatisticsLegend";
            chart.Legends.Add(lgnd);

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
                ser.Points.AddXY(1, 1);
                chart.Series.Add(ser);
            }
            else
            {
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

                    if (p.tooltip != null && p.tooltip != "") ser.Points.Last().ToolTip = p.tooltip;
                }

                chart.Series.Add(ser);
                chart.Series.Add(serBetter);
                chart.Series.Add(serWorse);
            }

            return chart;
        }
    }
}