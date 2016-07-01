using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Windows.Forms.DataVisualization.Charting;
using System.Windows.Input;

namespace ClusterExperiment
{
    public partial class Scatterplot : Form
    {
        public SqlConnection sql = null;
        private int eIDX = 0, eIDY = 0;
        private string category = "";
        private string noteX, noteY;
        private static double axisMinimum = 0.1;
        private uint errorLine = 100;
        private uint timeoutX = 1800;
        private uint timeoutY = 1800;
        private uint axisMaximum = 1800;
        private Dictionary<string, int> classes = new Dictionary<string, int>();
        private bool fancy = false;

        public Scatterplot(int eID1, int eID2, SqlConnection sql)
        {
            InitializeComponent();
            this.Text = "Plot: " + eID1 + " vs " + eID2;
            this.eIDX = eID1;
            this.eIDY = eID2;
            this.sql = sql;

            SqlCommand cmd = new SqlCommand("SELECT Timeout,Note,Category FROM Experiments WHERE ID=" + eID1, sql);
            cmd.CommandTimeout = 0;
            SqlDataReader r = cmd.ExecuteReader();
            string categoryX = "";
            if (r.Read())
            {
                timeoutX = Convert.ToUInt32((string)r[0]);
                noteX = (r[1].Equals(DBNull.Value)) ? "" : (string)r[1];
                categoryX = (r[2].Equals(DBNull.Value)) ? "" : (string)r[2];
            }
            r.Close();

            string categoryY = "";
            cmd = new SqlCommand("SELECT Timeout,Note,Category FROM Experiments WHERE ID=" + eID2, sql);
            cmd.CommandTimeout = 0;
            r = cmd.ExecuteReader();
            if (r.Read())
            {
                timeoutY = Convert.ToUInt32((string)r[0]);
                noteY = (r[1].Equals(DBNull.Value)) ? "" : (string)r[1];
                categoryY = (r[2].Equals(DBNull.Value)) ? "" : (string)r[2];
            }
            r.Close();

            category = (categoryX == categoryY) ? categoryX : categoryX + " -vs- " + categoryY;
        }

        private void setupChart()
        {
            chart.Legends.Clear();
            chart.Titles.Clear();

            axisMaximum = timeoutX;
            if (timeoutY > axisMaximum) axisMaximum = timeoutY;

            // Round max up to next order of magnitude.
            {
                uint orders = 0;
                uint temp = axisMaximum;
                while (temp > 0)
                {
                    temp = temp / 10;
                    orders++;
                }

                uint newmax = 1;
                for (uint i = 0; i < orders; i++)
                    newmax *= 10;

                if (newmax <= axisMaximum)
                {
                    // errorLine = ((newmax * 10) - newmax) / 2;
                    axisMaximum *= 10;
                }
                else
                {
                    // errorLine = axisMaximum + ((newmax - axisMaximum) / 2);
                    axisMaximum = newmax;
                }

                errorLine = axisMaximum;
            }

            Title t = new Title(category, Docking.Top);
            t.Font = new Font(FontFamily.GenericSansSerif, 16.0f, FontStyle.Bold);
            chart.Titles.Add(t);

            chart.ChartAreas[0].AxisX.Title = "Job #" + eIDX + ": " + noteX;
            chart.ChartAreas[0].AxisY.Title = "Job #" + eIDY + ": " + noteY;
            chart.ChartAreas[0].AxisY.TextOrientation = TextOrientation.Rotated270;
            chart.ChartAreas[0].AxisX.Minimum = axisMinimum;
            chart.ChartAreas[0].AxisX.Maximum = axisMaximum;
            chart.ChartAreas[0].AxisX.IsLogarithmic = true;
            chart.ChartAreas[0].AxisY.Minimum = axisMinimum;
            chart.ChartAreas[0].AxisY.Maximum = axisMaximum;
            chart.ChartAreas[0].AxisY.IsLogarithmic = true;
            chart.ChartAreas[0].AxisX.MajorGrid.LineDashStyle = ChartDashStyle.Dot;
            chart.ChartAreas[0].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dot;

            chart.Series.Clear();

            chart.Series.Add("Timeout Markers");
            chart.Series[0].ChartType = SeriesChartType.FastLine;
            chart.Series[0].Color = Color.Green;
            chart.Series[0].BorderDashStyle = ChartDashStyle.Dash;
            chart.Series[0].Points.AddXY(axisMinimum, timeoutY);
            chart.Series[0].Points.AddXY(timeoutX, timeoutY);
            chart.Series[0].Points.AddXY(timeoutX, axisMinimum);

            chart.Series.Add("Error Markers");
            chart.Series[1].ChartType = SeriesChartType.FastLine;
            chart.Series[1].Color = Color.Red;
            chart.Series[1].BorderDashStyle = ChartDashStyle.Dash;
            chart.Series[1].Points.AddXY(axisMinimum, errorLine);
            chart.Series[1].Points.AddXY(errorLine, errorLine);
            chart.Series[1].Points.AddXY(errorLine, axisMinimum);

            chart.Series.Add("Diagonal");
            chart.Series[2].ChartType = SeriesChartType.FastLine;
            chart.Series[2].Color = Color.Blue;
            chart.Series[2].BorderDashStyle = ChartDashStyle.Dash;
            chart.Series[2].Points.AddXY(axisMinimum, axisMinimum);
            chart.Series[2].Points.AddXY(axisMaximum, axisMaximum);

            classes.Clear();

            if (!fancy)
                addSeries("default");
        }

        private void addSeries(string title)
        {
            if (fancy)
            {
                chart.Series.Add(title);
                Series newSeries = chart.Series.Last();
                int inx = chart.Series.Count - 1;
                int m3 = inx % 3;
                int d3 = inx / 3;
                // newSeries.ChartType = SeriesChartType.FastPoint;
                newSeries.ChartType = SeriesChartType.Point;
                newSeries.MarkerStyle = MarkerStyle.Cross;
                newSeries.MarkerSize = 6;
                switch (m3)
                {
                    case 0: newSeries.MarkerColor = Color.FromArgb(0, 0, 255 / d3); break;
                    case 1: newSeries.MarkerColor = Color.FromArgb(0, 255 / d3, 0); break;
                    case 2: newSeries.MarkerColor = Color.FromArgb(255 / d3, 0, 0); break;
                }
                newSeries.XAxisType = AxisType.Primary;
                newSeries.YAxisType = AxisType.Primary;
            }
            else if (chart.Series.Count <= 3)
            {
                chart.Series.Add(title);
                Series newSeries = chart.Series.Last();
                newSeries.ChartType = SeriesChartType.FastPoint;
                newSeries.MarkerStyle = MarkerStyle.Cross;
                newSeries.MarkerSize = 6;
                newSeries.MarkerColor = Color.Blue;
                newSeries.XAxisType = AxisType.Primary;
                newSeries.YAxisType = AxisType.Primary;

                chart.Series.Add("Winners");
                newSeries = chart.Series.Last();
                newSeries.ChartType = SeriesChartType.FastPoint;
                newSeries.MarkerStyle = MarkerStyle.Cross;
                newSeries.MarkerSize = 6;
                newSeries.MarkerColor = Color.Green;
                newSeries.XAxisType = AxisType.Primary;
                newSeries.YAxisType = AxisType.Primary;

                chart.Series.Add("Losers");
                newSeries = chart.Series.Last();
                newSeries.ChartType = SeriesChartType.FastPoint;
                newSeries.MarkerStyle = MarkerStyle.Cross;
                newSeries.MarkerSize = 6;
                newSeries.MarkerColor = Color.OrangeRed;
                newSeries.XAxisType = AxisType.Primary;
                newSeries.YAxisType = AxisType.Primary;
            }
        }

        private void refreshChart()
        {
            string query = "SELECT a.Runtime,a.ResultCode,b.Runtime,b.ResultCode,a.SAT,a.UNSAT,b.SAT,b.UNSAT";
            if (fancy) query += ",Strings.s as name";
            query += " FROM Data a,Data b";
            if (fancy) query += ",Strings ";
            query += " WHERE a.ExperimentID=" + eIDX + " AND " +
                     "b.ExperimentID=" + eIDY + " AND " +
                     "a.FilenameP=b.FilenameP";
            if (fancy) query += " AND a.FilenameP=Strings.ID";

            SqlCommand cmd = new SqlCommand(query, sql);
            cmd.CommandTimeout = 0;
            SqlDataReader r = null;

            double totalX = 0.0, totalY = 0.0;
            uint total = 0, y_faster = 0, y_slower = 0;

            try
            {
                r = cmd.ExecuteReader();

                while (r.Read())
                {
                    double x = (r[0].Equals(DBNull.Value)) ? timeoutX : (double)r[0];
                    double y = (r[2].Equals(DBNull.Value)) ? timeoutY : (double)r[2];

                    if (x < axisMinimum) x = axisMinimum;
                    if (y < axisMinimum) y = axisMinimum;

                    int rc1 = (r[1].Equals(DBNull.Value)) ? 5 : (byte)r[1];
                    int rc2 = (r[3].Equals(DBNull.Value)) ? 5 : (byte)r[3];
                    int sat1 = (r[4].Equals(DBNull.Value)) ? 0 : (int)(r[4]);
                    int unsat1 = (r[5].Equals(DBNull.Value)) ? 0 : (int)(r[5]);
                    int sat2 = (r[6].Equals(DBNull.Value)) ? 0 : (int)(r[6]);
                    int unsat2 = (r[7].Equals(DBNull.Value)) ? 0 : (int)(r[7]);
                    int res1 = sat1 + unsat1;
                    int res2 = sat2 + unsat2;

                    if ( (!ckSAT.Checked && (sat1 > 0 || sat2 > 0)) ||
                         (!ckUNSAT.Checked && (unsat1 > 0 || unsat2 > 0)) ||
                         (!ckUNKNOWN.Checked && ( (rc1==0 && res1==0) || (rc2==0 && res2 == 0))) ||
                         (!ckBUG.Checked && (rc1 == 3 || rc2 == 3)) ||
                         (!ckERROR.Checked && (rc1 == 4 || rc2 == 4)) ||
                         (!ckTIME.Checked && (rc1 == 5 || rc2 == 5)) ||
                         (!ckMEMORY.Checked && (rc1 == 6 || rc2 == 6)))
                        continue;

                    if ((rc1 != 0 && rc1 != 5) || (x != timeoutX && res1 == 0))
                        x = errorLine;
                    if ((rc2 != 0 && rc2 != 5) || (y != timeoutY && res2 == 0))
                        y = errorLine;

                    if (x < timeoutX && y < timeoutY)
                    {
                        totalX += x;
                        totalY += y;
                    }

                    if (fancy)
                    {
                        string name = (string)r[8];
                        int inx = name.IndexOf('\\', name.IndexOf('\\') + 1);
                        string c = (inx > 0) ? name.Substring(0, inx) : name;
                        Series s;

                        if (classes.ContainsKey(c))
                            s = chart.Series[classes[c]];
                        else
                        {
                            addSeries(c);
                            classes.Add(c, chart.Series.Count - 1);
                            s = chart.Series.Last();
                        }

                        s.Points.AddXY(x, y);
                        s.Points.Last().ToolTip = name;
                    }
                    else
                    {
                        if ((sat1 < sat2 && unsat1 == unsat2) ||
                            (sat1 == sat2 && unsat1 < unsat2))
                            chart.Series[4].Points.AddXY(x, y);
                        else if ((sat1 > sat2 && unsat1 == unsat2) ||
                            (sat1 == sat2 && unsat1 > unsat2))
                            chart.Series[5].Points.AddXY(x, y);
                        else
                            chart.Series[3].Points.AddXY(x, y);
                    }

                    if (x > y) y_faster++; else if (y > x) y_slower++;
                    total++;
                }
            }
            finally
            {
                if (r != null) r.Close();
                chart.Update();
            }

            double avgSpeedup = totalX / totalY;
            lblAvgSpeedup.Text = avgSpeedup.ToString("N3");
            if (avgSpeedup >= 1.0)
                lblAvgSpeedup.ForeColor = Color.Green;
            else if (avgSpeedup < 1.0)
                lblAvgSpeedup.ForeColor = Color.Red;

            lblTotal.Text = total.ToString();
            lblFaster.Text = y_faster.ToString();
            lblSlower.Text = y_slower.ToString();
        }

        private void ScatterTest_Load(object sender, EventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            setupChart();
            refreshChart();
            Mouse.OverrideCursor = null;
        }

        private void ckCheckedChanged(object sender, EventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            fancy = cbFancy.Checked;
            setupChart();
            refreshChart();
            Mouse.OverrideCursor = null;
        }
    }
}
