using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Z3Data;

namespace Nightly
{
    public partial class History : System.Web.UI.Page
    {
        public DateTime _startTime = DateTime.Now;
        Timeline timeline = null;
        Configuration config = null;
        Dictionary<string, string> _defaultParams = null;

        public TimeSpan RenderTime
        {
            get { return DateTime.Now - _startTime; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                config = Application["Configuration"] as Configuration;

                try
                {
                    _defaultParams = new Dictionary<string, string>();
                    timeline = new Timeline(Server.MapPath("~"), config.datadir, config.timeline);
                    BuildEntries();
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

        protected void BuildEntries()
        {
            uint last_job_id = timeline.LastJobId;
            uint last_tag_id = 0;
            string last_tag_name = "";
            foreach (KeyValuePair<string, uint> kvp in config.tags)
            {
                if (kvp.Value > last_tag_id)
                {
                    last_tag_name = kvp.Key;
                    last_tag_id = kvp.Value;
                }
            }

            TableRow tr;
            TableCell tc;
            HyperLink h;

            for (int i = 0; i < timeline.RowCount; i++)
            {
                tr = new TableRow();
                
                if (i % 2 == 0) tr.BackColor = Color.LightGreen;
                else tr.BackColor = Color.LightGray;

                string id = timeline.Lookup(i, "ID");
                uint idi = Convert.ToUInt32(id);
                Job j = timeline.Job(idi);

                tc = new TableCell();
                h = new HyperLink();
                h.Text = id;
                h.NavigateUrl = "Default.aspx?job=" + id;
                tc.Controls.Add(h);
                tr.Cells.Add(tc);

                tc = new TableCell();
                tc.Text = j.MetaData.SubmissionTime.ToString();
                tc.HorizontalAlign = HorizontalAlign.Right;
                if (j.MetaData.isFinished)                    
                    tc.ForeColor = Color.Black;
                else
                    tc.ForeColor = Color.Gray;
                tr.Cells.Add(tc);

                tc = new TableCell();
                h = new HyperLink();
                h.NavigateUrl = "Compare.aspx?jobX=" + last_tag_id + "&jobY=" + id;
                h.Text = last_tag_name;
                tc.Controls.Add(h);
                tc.HorizontalAlign = HorizontalAlign.Center;
                tr.Cells.Add(tc);

                tc = new TableCell();
                h = new HyperLink();
                h.NavigateUrl = "Compare.aspx?jobX=" + last_job_id + "&jobY=" + id;
                h.Text = "latest";
                tc.Controls.Add(h);
                tr.Cells.Add(tc);

                tblEntries.Rows.Add(tr);
            }
        }

    }
}