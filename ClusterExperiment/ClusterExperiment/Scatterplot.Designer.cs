namespace ClusterExperiment
{
    partial class Scatterplot
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.Title title1 = new System.Windows.Forms.DataVisualization.Charting.Title();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Scatterplot));
            this.chart = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.cbFancy = new System.Windows.Forms.CheckBox();
            this.lblAvgSpeedupTxt = new System.Windows.Forms.Label();
            this.lblAvgSpeedup = new System.Windows.Forms.Label();
            this.ckSAT = new System.Windows.Forms.CheckBox();
            this.ckUNSAT = new System.Windows.Forms.CheckBox();
            this.gpOptions = new System.Windows.Forms.GroupBox();
            this.lblSlower = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lblFaster = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.lblTotal = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.lblDatapoints = new System.Windows.Forms.Label();
            this.ckTIME = new System.Windows.Forms.CheckBox();
            this.ckUNKNOWN = new System.Windows.Forms.CheckBox();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            ((System.ComponentModel.ISupportInitialize)(this.chart)).BeginInit();
            this.gpOptions.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // chart
            // 
            chartArea1.Name = "ChartArea1";
            this.chart.ChartAreas.Add(chartArea1);
            this.chart.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chart.Location = new System.Drawing.Point(0, 0);
            this.chart.Name = "chart";
            series1.ChartArea = "ChartArea1";
            series1.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.FastPoint;
            series1.Name = "Series1";
            this.chart.Series.Add(series1);
            this.chart.Size = new System.Drawing.Size(515, 529);
            this.chart.TabIndex = 0;
            this.chart.Text = "Scatterplot";
            title1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F);
            title1.Name = "Title1";
            title1.Text = "Title";
            this.chart.Titles.Add(title1);
            // 
            // cbFancy
            // 
            this.cbFancy.AutoSize = true;
            this.cbFancy.Location = new System.Drawing.Point(6, 19);
            this.cbFancy.Name = "cbFancy";
            this.cbFancy.Size = new System.Drawing.Size(55, 17);
            this.cbFancy.TabIndex = 1;
            this.cbFancy.Text = "Fancy";
            this.cbFancy.UseVisualStyleBackColor = true;
            this.cbFancy.CheckedChanged += new System.EventHandler(this.cbFancy_CheckedChanged);
            // 
            // lblAvgSpeedupTxt
            // 
            this.lblAvgSpeedupTxt.AutoSize = true;
            this.lblAvgSpeedupTxt.Location = new System.Drawing.Point(301, 20);
            this.lblAvgSpeedupTxt.Name = "lblAvgSpeedupTxt";
            this.lblAvgSpeedupTxt.Size = new System.Drawing.Size(167, 13);
            this.lblAvgSpeedupTxt.TabIndex = 2;
            this.lblAvgSpeedupTxt.Text = "Average speedup (excl. timeouts):";
            // 
            // lblAvgSpeedup
            // 
            this.lblAvgSpeedup.Location = new System.Drawing.Point(474, 20);
            this.lblAvgSpeedup.Name = "lblAvgSpeedup";
            this.lblAvgSpeedup.Size = new System.Drawing.Size(49, 13);
            this.lblAvgSpeedup.TabIndex = 3;
            this.lblAvgSpeedup.Text = "label1";
            // 
            // ckSAT
            // 
            this.ckSAT.AutoSize = true;
            this.ckSAT.Checked = true;
            this.ckSAT.CheckState = System.Windows.Forms.CheckState.Checked;
            this.ckSAT.Location = new System.Drawing.Point(6, 42);
            this.ckSAT.Name = "ckSAT";
            this.ckSAT.Size = new System.Drawing.Size(47, 17);
            this.ckSAT.TabIndex = 4;
            this.ckSAT.Text = "SAT";
            this.ckSAT.UseVisualStyleBackColor = true;
            this.ckSAT.CheckedChanged += new System.EventHandler(this.ckSAT_CheckedChanged);
            // 
            // ckUNSAT
            // 
            this.ckUNSAT.AutoSize = true;
            this.ckUNSAT.Checked = true;
            this.ckUNSAT.CheckState = System.Windows.Forms.CheckState.Checked;
            this.ckUNSAT.Location = new System.Drawing.Point(59, 42);
            this.ckUNSAT.Name = "ckUNSAT";
            this.ckUNSAT.Size = new System.Drawing.Size(63, 17);
            this.ckUNSAT.TabIndex = 5;
            this.ckUNSAT.Text = "UNSAT";
            this.ckUNSAT.UseVisualStyleBackColor = true;
            this.ckUNSAT.CheckedChanged += new System.EventHandler(this.ckUNSAT_CheckedChanged);
            // 
            // gpOptions
            // 
            this.gpOptions.Controls.Add(this.lblSlower);
            this.gpOptions.Controls.Add(this.label5);
            this.gpOptions.Controls.Add(this.lblFaster);
            this.gpOptions.Controls.Add(this.label3);
            this.gpOptions.Controls.Add(this.lblTotal);
            this.gpOptions.Controls.Add(this.label1);
            this.gpOptions.Controls.Add(this.lblDatapoints);
            this.gpOptions.Controls.Add(this.ckTIME);
            this.gpOptions.Controls.Add(this.ckUNKNOWN);
            this.gpOptions.Controls.Add(this.cbFancy);
            this.gpOptions.Controls.Add(this.lblAvgSpeedup);
            this.gpOptions.Controls.Add(this.ckUNSAT);
            this.gpOptions.Controls.Add(this.lblAvgSpeedupTxt);
            this.gpOptions.Controls.Add(this.ckSAT);
            this.gpOptions.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gpOptions.Location = new System.Drawing.Point(0, 0);
            this.gpOptions.Name = "gpOptions";
            this.gpOptions.Size = new System.Drawing.Size(515, 116);
            this.gpOptions.TabIndex = 6;
            this.gpOptions.TabStop = false;
            this.gpOptions.Text = "Options";
            // 
            // lblSlower
            // 
            this.lblSlower.Location = new System.Drawing.Point(418, 69);
            this.lblSlower.Name = "lblSlower";
            this.lblSlower.Size = new System.Drawing.Size(99, 13);
            this.lblSlower.TabIndex = 25;
            this.lblSlower.Text = "label1";
            this.lblSlower.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(366, 69);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(49, 13);
            this.label5.TabIndex = 24;
            this.label5.Text = "Y Slower";
            // 
            // lblFaster
            // 
            this.lblFaster.Location = new System.Drawing.Point(418, 56);
            this.lblFaster.Name = "lblFaster";
            this.lblFaster.Size = new System.Drawing.Size(99, 13);
            this.lblFaster.TabIndex = 23;
            this.lblFaster.Text = "label1";
            this.lblFaster.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(366, 56);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(46, 13);
            this.label3.TabIndex = 22;
            this.label3.Text = "Y Faster";
            // 
            // lblTotal
            // 
            this.lblTotal.Location = new System.Drawing.Point(418, 43);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(99, 16);
            this.lblTotal.TabIndex = 21;
            this.lblTotal.Text = "label1";
            this.lblTotal.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(366, 43);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(31, 13);
            this.label1.TabIndex = 20;
            this.label1.Text = "Total";
            // 
            // lblDatapoints
            // 
            this.lblDatapoints.AutoSize = true;
            this.lblDatapoints.Location = new System.Drawing.Point(299, 42);
            this.lblDatapoints.Name = "lblDatapoints";
            this.lblDatapoints.Size = new System.Drawing.Size(61, 13);
            this.lblDatapoints.TabIndex = 19;
            this.lblDatapoints.Text = "Datapoints:";
            // 
            // ckTIME
            // 
            this.ckTIME.AutoSize = true;
            this.ckTIME.Checked = true;
            this.ckTIME.CheckState = System.Windows.Forms.CheckState.Checked;
            this.ckTIME.Location = new System.Drawing.Point(218, 42);
            this.ckTIME.Name = "ckTIME";
            this.ckTIME.Size = new System.Drawing.Size(64, 17);
            this.ckTIME.TabIndex = 7;
            this.ckTIME.Text = "Timeout";
            this.ckTIME.UseVisualStyleBackColor = true;
            this.ckTIME.CheckedChanged += new System.EventHandler(this.ckTIME_CheckedChanged);
            // 
            // ckUNKNOWN
            // 
            this.ckUNKNOWN.AutoSize = true;
            this.ckUNKNOWN.Checked = true;
            this.ckUNKNOWN.CheckState = System.Windows.Forms.CheckState.Checked;
            this.ckUNKNOWN.Location = new System.Drawing.Point(128, 42);
            this.ckUNKNOWN.Name = "ckUNKNOWN";
            this.ckUNKNOWN.Size = new System.Drawing.Size(84, 17);
            this.ckUNKNOWN.TabIndex = 6;
            this.ckUNKNOWN.Text = "UNKNOWN";
            this.ckUNKNOWN.UseVisualStyleBackColor = true;
            this.ckUNKNOWN.CheckedChanged += new System.EventHandler(this.ckUNKNOWN_CheckedChanged);
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel2;
            this.splitContainer1.IsSplitterFixed = true;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.chart);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.gpOptions);
            this.splitContainer1.Size = new System.Drawing.Size(515, 649);
            this.splitContainer1.SplitterDistance = 529;
            this.splitContainer1.TabIndex = 7;
            // 
            // Scatterplot
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(515, 649);
            this.Controls.Add(this.splitContainer1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Scatterplot";
            this.Text = "ScatterPlot";
            this.Load += new System.EventHandler(this.ScatterTest_Load);
            ((System.ComponentModel.ISupportInitialize)(this.chart)).EndInit();
            this.gpOptions.ResumeLayout(false);
            this.gpOptions.PerformLayout();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataVisualization.Charting.Chart chart;
        private System.Windows.Forms.CheckBox cbFancy;
        private System.Windows.Forms.Label lblAvgSpeedupTxt;
        private System.Windows.Forms.Label lblAvgSpeedup;
        private System.Windows.Forms.CheckBox ckSAT;
        private System.Windows.Forms.CheckBox ckUNSAT;
        private System.Windows.Forms.GroupBox gpOptions;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.CheckBox ckTIME;
        private System.Windows.Forms.CheckBox ckUNKNOWN;
        private System.Windows.Forms.Label lblSlower;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label lblFaster;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblDatapoints;
    }
}