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
    public partial class GroupScatterPlot : Form
    {
        public SqlConnection sql = null;
        int gIDX = 0, gIDY = 0;
        string nameX, nameY;
        string noteX, noteY;
        string catX, catY;
        private static uint axisMinimum = 1;
        private uint errorLine = 1000;
        uint timeoutX = 100;
        uint timeoutY = 100;
        uint axisMaximum = 1000;
        List<int> expsX = new List<int>();
        List<int> expsY = new List<int>();
        Dictionary<string, int> classes = new Dictionary<string, int>();
        bool fancy = false;
        uint aggMode = 1; // AVG

        public GroupScatterPlot(SqlConnection sql)
        {
            InitializeComponent();
            this.Text = "Plot: Group " + gIDX + " vs Group " + gIDY;            
            this.sql = sql;

        }

        public bool ShowPlot(int gIDX, int gIDY)
        {
            this.gIDX = gIDX;
            this.gIDY = gIDY;

            SqlCommand cmd = new SqlCommand("SELECT Name,Note,Category FROM Jobgroups WHERE ID=" + gIDX, sql);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                nameX = (r[0].Equals(DBNull.Value)) ? "" : (string)r[0];
                noteX = (r[1].Equals(DBNull.Value)) ? "" : (string)r[1];
                catX = (r[2].Equals(DBNull.Value)) ? "" : (string)r[2];
            }
            else
            {
                MessageBox.Show(this, "Jobgroup ID not found.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                r.Close();
                return false;
            }
            r.Close();

            cmd = new SqlCommand("SELECT JobID FROM JobGroupData WHERE GroupID=" + gIDX, sql);
            r = cmd.ExecuteReader();
            while (r.Read())
                expsX.Add((int)r[0]);
            r.Close();

            cmd = new SqlCommand("SELECT Name,Note,Category FROM Jobgroups WHERE ID=" + gIDY, sql);
            r = cmd.ExecuteReader();
            if (r.Read())
            {
                nameY = (r[0].Equals(DBNull.Value)) ? "" : (string)r[0];
                noteY = (r[1].Equals(DBNull.Value)) ? "" : (string)r[1];
                catY = (r[2].Equals(DBNull.Value)) ? "" : (string)r[2];
            }
            else
            {
                MessageBox.Show(this, "Jobgroup ID not found.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                r.Close();
                return false;
            }
            r.Close();

            if (catY != catX)
            {
                MessageBox.Show(this, "Jobgroup categories don't match.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                r.Close();
                return false;
            }

            cmd = new SqlCommand("SELECT JobID FROM JobGroupData WHERE GroupID=" + gIDY, sql);
            r = cmd.ExecuteReader();
            while (r.Read())
                expsY.Add((int)r[0]);
            r.Close();

            timeoutX = 0;
            foreach (uint j in expsX)
            {
                cmd = new SqlCommand("SELECT Timeout FROM Experiments WHERE ID=" + j, sql);
                r = cmd.ExecuteReader();
                if (r.Read())
                {
                    uint t = Convert.ToUInt32((string)r[0]);
                    if (t > timeoutX) timeoutX = t;
                }
                r.Close();
            }

            timeoutY = 0;
            foreach (uint j in expsY)
            {
                cmd = new SqlCommand("SELECT Timeout FROM Experiments WHERE ID=" + j, sql);
                r = cmd.ExecuteReader();
                if (r.Read())
                {
                    uint t = Convert.ToUInt32((string)r[0]);
                    if (t > timeoutY) timeoutY = t;
                }
                r.Close();
            }

            return true;
        }

        private void setupChart()
        {
            chart.Legends.Clear();

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

            chart.ChartAreas[0].AxisX.Title = "Job group #" + gIDX + ": " + nameX + "(" + noteX + ")";
            chart.ChartAreas[0].AxisY.Title = "Job group #" + gIDY + ": " + nameY + "(" + noteY + ")";
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

        private class DataEntry { public double runtime; public int resultcode, sat, unsat; public string name; };

        private class DataEntryMinComp : IComparer<DataEntry>
        {
            public int Compare(DataEntry x, DataEntry y)
            {
                if (x.runtime < y.runtime) return -1;
                else if (x.runtime > y.runtime) return +1;
                else return 0;
            }
        };

        private void refreshChart()
        {
            Dictionary<int, List<DataEntry>> dataX = new Dictionary<int, List<DataEntry>>();
            Dictionary<int, List<DataEntry>> dataY = new Dictionary<int, List<DataEntry>>();

            string queryA = "SELECT a.FilenameP,a.Runtime,a.ResultCode,a.SAT,a.UNSAT";
            if (fancy) queryA += ",Strings.s as name";
            queryA += " FROM Data a";
            if (fancy) queryA += ",Strings ";
            queryA += " WHERE a.ExperimentID IN (SELECT JobID FROM JobGroupData WHERE GroupID=" + gIDX + ") ";
            if (fancy) queryA += " AND a.FilenameP=Strings.ID";

            SqlCommand cmd = new SqlCommand(queryA, sql);
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
            {
                DataEntry ne = new DataEntry();
                int fnp = (int)r[0];
                ne.resultcode = (r[2].Equals(DBNull.Value)) ? 5 : (byte)r[2];
                ne.runtime = (r[1].Equals(DBNull.Value)) ? timeoutX : (double)r[1];
                ne.sat = (r[3].Equals(DBNull.Value)) ? 0 : (int)(r[3]);
                ne.unsat = (r[4].Equals(DBNull.Value)) ? 0 : (int)(r[4]);
                if (fancy)
                    ne.name = (r[5].Equals(DBNull.Value)) ? "" : (string)(r[5]);
                if (!dataX.ContainsKey(fnp)) dataX[fnp] = new List<DataEntry>();
                dataX[fnp].Add(ne);
            }
            r.Close();

            string queryB = "SELECT a.FilenameP,a.Runtime,a.ResultCode,a.SAT,a.UNSAT";
            if (fancy) queryB += ",Strings.s as name";
            queryB += " FROM Data a";
            if (fancy) queryB += ",Strings ";
            queryB += " WHERE a.ExperimentID IN (SELECT JobID FROM JobGroupData WHERE GroupID=" + gIDY + ") ";
            if (fancy) queryB += " AND a.FilenameP=Strings.ID";

            cmd = new SqlCommand(queryB, sql);
            r = cmd.ExecuteReader();
            while (r.Read())
            {
                DataEntry ne = new DataEntry();
                int fnp = (int)r[0];
                ne.resultcode = (r[2].Equals(DBNull.Value)) ? 5 : (byte)r[2];
                ne.runtime = (r[1].Equals(DBNull.Value)) ? timeoutY : (double)r[1];
                ne.sat = (r[3].Equals(DBNull.Value)) ? 0 : (int)(r[3]);
                ne.unsat = (r[4].Equals(DBNull.Value)) ? 0 : (int)(r[4]);
                if (fancy)
                    ne.name = (r[5].Equals(DBNull.Value)) ? "" : (string)(r[5]);

                if (ne.resultcode == 5)
                    ne.runtime = timeoutX;
                else if (ne.resultcode != 0)
                    ne.runtime = errorLine;

                if (!dataY.ContainsKey(fnp)) dataY[fnp] = new List<DataEntry>();
                dataY[fnp].Add(ne);
            }
            r.Close();

            double totalX = 0.0, totalY = 0.0;
            uint faster = 0, slower = 0, total = 0;

            foreach (KeyValuePair<int, List<DataEntry>> pX in dataX)
            {
                int fnp = pX.Key;
                List<DataEntry> dX = pX.Value;
                List<DataEntry> dY = dataY[fnp];

                double x = 0.0, y = 0.0;
                DataEntryMinComp decomp = new DataEntryMinComp();

                double satX = 0.0, satY = 0.0, unsatX = 0.0, unsatY = 0.0;

                switch (aggMode)
                {
                    case 0: // Min                
                        dX.Sort(decomp);
                        dY.Sort(decomp);
                        x = dX.First().runtime;
                        y = dY.First().runtime;
                        satX = dX.First().sat;
                        unsatX = dX.First().unsat;
                        satY = dY.First().sat;
                        unsatY = dY.First().unsat;
                        break;
                    case 1: // Avg
                        foreach (DataEntry xe in dX)
                        {
                            x += xe.runtime;
                            satX += xe.sat;
                            unsatX += xe.unsat;
                        }
                        x /= dX.Count; satX /= dX.Count; unsatX /= dX.Count;
                        foreach (DataEntry ye in dY)
                        {
                            y += ye.runtime;
                            satY += ye.sat;
                            unsatY += ye.unsat;
                        }
                        y /= dY.Count; satY /= dY.Count; unsatY /= dY.Count;
                        break;
                    case 2: // Med
                        dX.Sort(decomp);
                        dY.Sort(decomp);
                        x = (dX.Count % 2 == 1) ? dX[dX.Count / 2].runtime : (dX[(dX.Count / 2) - 1].runtime + dX[dX.Count / 2].runtime) / 2;
                        y = (dY.Count % 2 == 1) ? dY[dY.Count / 2].runtime : (dY[(dY.Count / 2) - 1].runtime + dY[dY.Count / 2].runtime) / 2;
                        satX = (dX.Count % 2 == 1) ? dX[dX.Count / 2].sat : (dX[(dX.Count / 2) - 1].sat + dX[dX.Count / 2].sat) / 2;
                        unsatX = (dX.Count % 2 == 1) ? dX[dX.Count / 2].unsat : (dX[(dX.Count / 2) - 1].unsat + dX[dX.Count / 2].unsat) / 2;
                        satY = (dY.Count % 2 == 1) ? dY[dY.Count / 2].sat : (dY[(dY.Count / 2) - 1].sat + dY[dY.Count / 2].sat) / 2;
                        unsatY = (dY.Count % 2 == 1) ? dY[dY.Count / 2].unsat : (dY[(dY.Count / 2) - 1].unsat + dY[dY.Count / 2].unsat) / 2;
                        break;
                    case 3: // Max                        
                        dX.Sort(decomp);
                        dY.Sort(decomp);
                        x = dX.Last().runtime;
                        y = dY.Last().runtime;
                        satX = dX.Last().sat;
                        unsatX = dX.Last().unsat;
                        satY = dY.Last().sat;
                        unsatY = dY.Last().unsat;
                        break;
                }

                if (x < axisMinimum) x = axisMinimum;
                if (y < axisMinimum) y = axisMinimum;

                if ((!ckSAT.Checked && (satX > 0.0 || satY > 0.0)) ||
                     (!ckUNSAT.Checked && (unsatX > 0.0 || unsatY > 0.0)))
                    continue;

                if (x < timeoutX && y < timeoutY)
                {
                    totalX += x;
                    totalY += y;
                }

                if (fancy)
                {
                    string name = dX.First().name;
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
                    if ((satX < satY && unsatX == unsatY) ||
                        (satX == satY && unsatX < unsatY))
                        chart.Series[4].Points.AddXY(x, y);
                    else if ((satX > satY && unsatX == unsatY) ||
                        (satX == satY && unsatX > unsatY))
                        chart.Series[5].Points.AddXY(x, y);
                    else
                        chart.Series[3].Points.AddXY(x, y);

                    if (x > y) faster++; else if (y > x) slower++;
                }

                total++;
            }

            chart.Update();

            double avgSpeedup = totalX / totalY;
            lblAvgSpeedup.Text = Convert.ToString(avgSpeedup);
            if (avgSpeedup >= 1.0)
                lblAvgSpeedup.ForeColor = Color.Green;
            else if (avgSpeedup < 1.0)
                lblAvgSpeedup.ForeColor = Color.Red;

            lblTotal.Text = total.ToString();
            lblFaster.Text = faster.ToString();
            lblSlower.Text = slower.ToString();
        }

        private void ScatterTest_Load(object sender, EventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            setupChart();
            refreshChart();
            Mouse.OverrideCursor = null;
        }

        private void cbFancy_CheckedChanged(object sender, EventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            fancy = cbFancy.Checked;
            setupChart();
            refreshChart();
            Mouse.OverrideCursor = null;
        }

        private void ckSAT_CheckedChanged(object sender, EventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            fancy = cbFancy.Checked;
            setupChart();
            refreshChart();
            Mouse.OverrideCursor = null;
        }

        private void ckUNSAT_CheckedChanged(object sender, EventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            fancy = cbFancy.Checked;
            setupChart();
            refreshChart();
            Mouse.OverrideCursor = null;
        }

        private void radioMin_CheckedChanged(object sender, EventArgs e)
        {
            if (radioMin.Checked)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                aggMode = 0;
                setupChart();
                refreshChart();
                Mouse.OverrideCursor = null;
            }
        }

        private void radioAVG_CheckedChanged(object sender, EventArgs e)
        {
            if (radioAVG.Checked)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                aggMode = 1;
                setupChart();
                refreshChart();
                Mouse.OverrideCursor = null;
            }
        }

        private void radioMED_CheckedChanged(object sender, EventArgs e)
        {
            if (radioMED.Checked)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                aggMode = 2;
                setupChart();
                refreshChart();
                Mouse.OverrideCursor = null;
            }
        }

        private void radioMAX_CheckedChanged(object sender, EventArgs e)
        {
            if (radioMAX.Checked)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                aggMode = 3;
                setupChart();
                refreshChart();
                Mouse.OverrideCursor = null;
            }
        }
    }
}