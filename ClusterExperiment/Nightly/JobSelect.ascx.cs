using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nightly
{
    public partial class JobSelect : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
        }

        public DropDownList TaglistX { get { return lstTagX; } }
        public DropDownList TaglistY { get { return lstTagY; } }
        public string IDX { get { return txtIDX.Text; } set { txtIDX.Text = value; } }
        public string IDY { get { return txtIDY.Text; } set { txtIDY.Text = value; } }
        public void CheckTagX() { rbnTagX.Checked = true; }
        public void CheckTagY() { rbnTagY.Checked = true; }
        public void CheckIDX() { rbnIDX.Checked = true; }
        public void CheckIDY() { rbnIDY.Checked = true; }
    }
}