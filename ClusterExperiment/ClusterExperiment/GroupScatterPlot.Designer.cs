namespace ClusterExperiment
{
    partial class GroupScatterPlot
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
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea4 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend4 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series4 = new System.Windows.Forms.DataVisualization.Charting.Series();
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
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.radioMAX = new System.Windows.Forms.RadioButton();
            this.radioMED = new System.Windows.Forms.RadioButton();
            this.radioMin = new System.Windows.Forms.RadioButton();
            this.radioAVG = new System.Windows.Forms.RadioButton();
            ((System.ComponentModel.ISupportInitialize)(this.chart)).BeginInit();
            this.gpOptions.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // chart
            // 
            chartArea4.Name = "ChartArea1";
            this.chart.ChartAreas.Add(chartArea4);
            this.chart.Dock = System.Windows.Forms.DockStyle.Fill;
            legend4.Name = "Legend1";
            this.chart.Legends.Add(legend4);
            this.chart.Location = new System.Drawing.Point(0, 0);
            this.chart.Name = "chart";
            series4.ChartArea = "ChartArea1";
            series4.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.FastPoint;
            series4.Legend = "Legend1";
            series4.Name = "Series1";
            this.chart.Series.Add(series4);
            this.chart.Size = new System.Drawing.Size(529, 500);
            this.chart.TabIndex = 0;
            this.chart.Text = "Scatterplot";
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
            this.lblAvgSpeedupTxt.Location = new System.Drawing.Point(295, 20);
            this.lblAvgSpeedupTxt.Name = "lblAvgSpeedupTxt";
            this.lblAvgSpeedupTxt.Size = new System.Drawing.Size(167, 13);
            this.lblAvgSpeedupTxt.TabIndex = 2;
            this.lblAvgSpeedupTxt.Text = "Average speedup (excl. timeouts):";
            // 
            // lblAvgSpeedup
            // 
            this.lblAvgSpeedup.Location = new System.Drawing.Point(468, 20);
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
            this.gpOptions.Controls.Add(this.groupBox1);
            this.gpOptions.Controls.Add(this.lblSlower);
            this.gpOptions.Controls.Add(this.label5);
            this.gpOptions.Controls.Add(this.lblFaster);
            this.gpOptions.Controls.Add(this.label3);
            this.gpOptions.Controls.Add(this.lblTotal);
            this.gpOptions.Controls.Add(this.label1);
            this.gpOptions.Controls.Add(this.lblDatapoints);
            this.gpOptions.Controls.Add(this.cbFancy);
            this.gpOptions.Controls.Add(this.lblAvgSpeedup);
            this.gpOptions.Controls.Add(this.ckUNSAT);
            this.gpOptions.Controls.Add(this.lblAvgSpeedupTxt);
            this.gpOptions.Controls.Add(this.ckSAT);
            this.gpOptions.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gpOptions.Location = new System.Drawing.Point(0, 0);
            this.gpOptions.Name = "gpOptions";
            this.gpOptions.Size = new System.Drawing.Size(529, 116);
            this.gpOptions.TabIndex = 6;
            this.gpOptions.TabStop = false;
            this.gpOptions.Text = "Options";
            // 
            // lblSlower
            // 
            this.lblSlower.Location = new System.Drawing.Point(413, 69);
            this.lblSlower.Name = "lblSlower";
            this.lblSlower.Size = new System.Drawing.Size(104, 13);
            this.lblSlower.TabIndex = 18;
            this.lblSlower.Text = "label1";
            this.lblSlower.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(361, 69);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(49, 13);
            this.label5.TabIndex = 17;
            this.label5.Text = "Y Slower";
            // 
            // lblFaster
            // 
            this.lblFaster.Location = new System.Drawing.Point(413, 56);
            this.lblFaster.Name = "lblFaster";
            this.lblFaster.Size = new System.Drawing.Size(104, 13);
            this.lblFaster.TabIndex = 16;
            this.lblFaster.Text = "label1";
            this.lblFaster.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(361, 56);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(46, 13);
            this.label3.TabIndex = 15;
            this.label3.Text = "Y Faster";
            // 
            // lblTotal
            // 
            this.lblTotal.Location = new System.Drawing.Point(410, 42);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(107, 13);
            this.lblTotal.TabIndex = 14;
            this.lblTotal.Text = "label1";
            this.lblTotal.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(361, 43);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(31, 13);
            this.label1.TabIndex = 13;
            this.label1.Text = "Total";
            // 
            // lblDatapoints
            // 
            this.lblDatapoints.AutoSize = true;
            this.lblDatapoints.Location = new System.Drawing.Point(294, 42);
            this.lblDatapoints.Name = "lblDatapoints";
            this.lblDatapoints.Size = new System.Drawing.Size(61, 13);
            this.lblDatapoints.TabIndex = 12;
            this.lblDatapoints.Text = "Datapoints:";
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
            this.splitContainer1.Size = new System.Drawing.Size(529, 620);
            this.splitContainer1.SplitterDistance = 500;
            this.splitContainer1.TabIndex = 7;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.radioMAX);
            this.groupBox1.Controls.Add(this.radioMED);
            this.groupBox1.Controls.Add(this.radioMin);
            this.groupBox1.Controls.Add(this.radioAVG);
            this.groupBox1.Location = new System.Drawing.Point(6, 65);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(233, 39);
            this.groupBox1.TabIndex = 19;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Aggregation Mode";
            // 
            // radioMAX
            // 
            this.radioMAX.AutoSize = true;
            this.radioMAX.Location = new System.Drawing.Point(181, 16);
            this.radioMAX.Name = "radioMAX";
            this.radioMAX.Size = new System.Drawing.Size(45, 17);
            this.radioMAX.TabIndex = 15;
            this.radioMAX.Text = "Max";
            this.radioMAX.UseVisualStyleBackColor = true;
            this.radioMAX.CheckedChanged += new System.EventHandler(this.radioMAX_CheckedChanged);
            // 
            // radioMED
            // 
            this.radioMED.AutoSize = true;
            this.radioMED.Location = new System.Drawing.Point(122, 16);
            this.radioMED.Name = "radioMED";
            this.radioMED.Size = new System.Drawing.Size(60, 17);
            this.radioMED.TabIndex = 14;
            this.radioMED.Text = "Median";
            this.radioMED.UseVisualStyleBackColor = true;
            this.radioMED.CheckedChanged += new System.EventHandler(this.radioMED_CheckedChanged);
            // 
            // radioMin
            // 
            this.radioMin.AutoSize = true;
            this.radioMin.Location = new System.Drawing.Point(9, 16);
            this.radioMin.Name = "radioMin";
            this.radioMin.Size = new System.Drawing.Size(42, 17);
            this.radioMin.TabIndex = 13;
            this.radioMin.Text = "Min";
            this.radioMin.UseVisualStyleBackColor = true;
            this.radioMin.CheckedChanged += new System.EventHandler(this.radioMin_CheckedChanged);
            // 
            // radioAVG
            // 
            this.radioAVG.AutoSize = true;
            this.radioAVG.Checked = true;
            this.radioAVG.Location = new System.Drawing.Point(51, 16);
            this.radioAVG.Name = "radioAVG";
            this.radioAVG.Size = new System.Drawing.Size(65, 17);
            this.radioAVG.TabIndex = 12;
            this.radioAVG.TabStop = true;
            this.radioAVG.Text = "Average";
            this.radioAVG.UseVisualStyleBackColor = true;
            this.radioAVG.CheckedChanged += new System.EventHandler(this.radioAVG_CheckedChanged);
            // 
            // GroupScatterPlot
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(529, 620);
            this.Controls.Add(this.splitContainer1);
            this.Name = "GroupScatterPlot";
            this.Text = "Group Scatterplot";
            this.Load += new System.EventHandler(this.ScatterTest_Load);
            ((System.ComponentModel.ISupportInitialize)(this.chart)).EndInit();
            this.gpOptions.ResumeLayout(false);
            this.gpOptions.PerformLayout();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
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
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblDatapoints;
        private System.Windows.Forms.Label lblFaster;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.Label lblSlower;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton radioMAX;
        private System.Windows.Forms.RadioButton radioMED;
        private System.Windows.Forms.RadioButton radioMin;
        private System.Windows.Forms.RadioButton radioAVG;
    }
}