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


                    Job jX = null, jY = null;

                    try
                    {
                        jX = (j1 == null) ? null : new Job(config.DATADIR, (uint)Convert.ToInt32(j1), true);
                        jY = (j2 == null) ? null : new Job(config.DATADIR, (uint)Convert.ToInt32(j2), true);
                    }
                    catch (Exception)
                    {
                    }

                    js.TaglistX.ClearSelection();
                    js.TaglistY.ClearSelection();

                    if (config.Tags.HasTag(jX.MetaData.Id))
                    {
                        js.TaglistX.SelectedValue = jX.MetaData.Id.ToString();
                        js.CheckTagX();
                    }
                    else
                    {
                        js.TaglistX.SelectedIndex = 0;
                        js.CheckIDX();
                    }
                    
                    if (config.Tags.HasTag(jY.MetaData.Id))
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

                    cmp = new Comparison(jX, jY, config.Tags);

                    phMain.Controls.Add(buildChartPanel(false, "CHART", ""));
                    phMain.Controls.Add(buildSummaryPanel());
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

        protected TabPanel buildSummaryTab()
        {
            TabPanel tabSummary = new TabPanel();
            string toolTip = "A summary of the comparison.";
            TabHeaderTemplate htm = new TabHeaderTemplate(AlertLevel.None, "Summary", toolTip);
            tabSummary.HeaderTemplate = htm;
            tabSummary.ContentTemplate = new TabContentTemplate(new List<string>());
            return tabSummary;
        }

        protected Control buildSummaryPanel()
        {
            TabContainer tc = new TabContainer();
            tc.Height = 200;
            tc.ScrollBars = ScrollBars.Vertical;

            TabPanel tabSummary = buildSummaryTab();

            TabPanel tabStats = new TabPanel();
            tabStats.HeaderTemplate = new TabHeaderTemplate(AlertLevel.None, "Statistics", "Statistical information about the job.");
            tabStats.ContentTemplate = new TabContentTemplate(new List<string>());

            tc.Tabs.Add(tabSummary);

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
            l1.Text = cmp.Title;
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

            chart.Height = 600;
            chart.Width = 600;

            ChartArea ca = new ChartArea();
            ca.Name = "ScatterPlot";

            ca.AxisX.Minimum = 0.1;
            ca.AxisX.IsLogarithmic = true;
            ca.AxisX.LogarithmBase = 10;
            ca.AxisY.LabelStyle.IsEndLabelVisible = true;
            ca.AxisY.LabelAutoFitStyle = LabelAutoFitStyles.None;
            ca.AxisY.LabelAutoFitMinFontSize = 8;
            ca.AxisY.LabelAutoFitMaxFontSize = 8;

            ca.AxisY.Minimum = 0.1;
            ca.AxisY.IsLogarithmic = true;
            ca.AxisY.LogarithmBase = 10;
            ca.AxisY.LabelStyle.IsEndLabelVisible = true;
            ca.AxisY.LabelAutoFitStyle = LabelAutoFitStyles.None;
            ca.AxisY.LabelAutoFitMinFontSize = 8;
            ca.AxisY.LabelAutoFitMaxFontSize = 8;

            // ca.Position.Height = 25;
            // ca.Position.Width = 85;
            ca.Position.Auto = true;

            chart.ChartAreas.Add(ca);

            if (!cmp.HasJobs)
            {
                ca.AxisX.Maximum = 100000;
                ca.AxisY.Maximum = 100000;

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

                ca.AxisX.CustomLabels.Add(new CustomLabel(cmp.TimeOutX - 4, cmp.TimeOutX + 4, "T", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisX.CustomLabels.Add(new CustomLabel(cmp.MemOutX - 4, cmp.MemOutX + 4, "M", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisX.CustomLabels.Add(new CustomLabel(cmp.ErrorX - 4, cmp.ErrorX + 4, "E", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisY.CustomLabels.Add(new CustomLabel(cmp.TimeOutY - 4, cmp.TimeOutY + 4, "T", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisY.CustomLabels.Add(new CustomLabel(cmp.MemOutY - 4, cmp.MemOutY + 4, "M", 0, LabelMarkStyle.SideMark, GridTickTypes.All));
                ca.AxisY.CustomLabels.Add(new CustomLabel(cmp.ErrorY - 4, cmp.ErrorY + 4, "E", 0, LabelMarkStyle.SideMark, GridTickTypes.All));

                ca.AxisX.CustomLabels.Add(new CustomLabel(1, 1 + 8, "1", 0, LabelMarkStyle.None, GridTickTypes.Gridline));
                ca.AxisX.CustomLabels.Add(new CustomLabel(10, 10 + 16, "10", 0, LabelMarkStyle.None, GridTickTypes.Gridline));
                ca.AxisX.CustomLabels.Add(new CustomLabel(100, 100 + 24, "100", 0, LabelMarkStyle.None, GridTickTypes.Gridline));
                ca.AxisX.CustomLabels.Add(new CustomLabel(1000, 1000 + 32, "1000", 0, LabelMarkStyle.None, GridTickTypes.Gridline));

                ca.AxisY.CustomLabels.Add(new CustomLabel(1, 1 + 8, "1", 0, LabelMarkStyle.None, GridTickTypes.Gridline));
                ca.AxisY.CustomLabels.Add(new CustomLabel(10, 10 + 16, "10", 0, LabelMarkStyle.None, GridTickTypes.Gridline));
                ca.AxisY.CustomLabels.Add(new CustomLabel(100, 100 + 24, "100", 0, LabelMarkStyle.None, GridTickTypes.Gridline));
                ca.AxisY.CustomLabels.Add(new CustomLabel(1000, 1000 + 32, "1000", 0, LabelMarkStyle.None, GridTickTypes.Gridline));

                Series serTimeout = new Series("Timeouts");
                serTimeout.ChartArea = ca.Name;
                serTimeout.ChartType = SeriesChartType.FastLine;
                serTimeout.Color = Color.Black;
                serTimeout.Points.AddXY(ca.AxisX.Minimum, cmp.TimeOutY);
                serTimeout.Points.AddXY(cmp.TimeOutX, cmp.TimeOutY);
                serTimeout.Points.AddXY(cmp.TimeOutX, ca.AxisY.Minimum);
                chart.Series.Add(serTimeout);

                Series serMemout = new Series("Memouts");
                serMemout.ChartArea = ca.Name;
                serMemout.ChartType = SeriesChartType.FastLine;
                serMemout.Color = Color.Green;
                serMemout.Points.AddXY(ca.AxisX.Minimum, cmp.MemOutY);
                serMemout.Points.AddXY(cmp.MemOutX, cmp.MemOutY);
                serMemout.Points.AddXY(cmp.MemOutX, ca.AxisY.Minimum);
                chart.Series.Add(serMemout);

                Series serErrors = new Series("Errors");
                serErrors.ChartArea = ca.Name;
                serErrors.ChartType = SeriesChartType.FastLine;
                serErrors.Color = Color.Red;
                serErrors.Points.AddXY(ca.AxisX.Minimum, cmp.ErrorY);
                serErrors.Points.AddXY(cmp.ErrorX, cmp.ErrorY);
                serErrors.Points.AddXY(cmp.ErrorX, ca.AxisY.Minimum);
                chart.Series.Add(serErrors);

                Series serDiag = new Series("Diagonal");
                serDiag.ChartArea = ca.Name;
                serDiag.ChartType = SeriesChartType.FastLine;
                serDiag.Color = Color.Black;
                serDiag.Points.AddXY(ca.AxisX.Minimum, ca.AxisY.Minimum);
                serDiag.Points.AddXY(cmp.ErrorX, cmp.ErrorY);
                chart.Series.Add(serDiag);

                Series ser = new Series(cmp.Title);
                ser.ChartArea = ca.Name;
                ser.ChartType = SeriesChartType.Point;
                ser.Color = Color.Blue;
                ser.MarkerSize = 5;
                ser.MarkerStyle = MarkerStyle.Cross;
                ser.MarkerBorderWidth = 0;

                foreach (Comparison.Point p in cmp.Datapoints)
                {
                    ser.Points.AddXY(p.x, p.y);
                    if (p.isSpecial) ser.Points.Last().Color = Color.Red;
                    if (p.tooltip != null && p.tooltip != "") ser.Points.Last().ToolTip = p.tooltip;
                }

                chart.Series.Add(ser);
            }

            return chart;
        }
    }
}