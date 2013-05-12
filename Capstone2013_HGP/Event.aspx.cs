using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Capstone2013_HGP
{
    public partial class Event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvEvents_PageIndexChanged(object sender, EventArgs e)
        {
            gvEvents.SelectedIndex = -1;
        }

        protected void gvEvents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvEvents.Rows[index];
                Response.Redirect("~/Order.aspx?EventID=" + row.Cells[1].Text.ToString());
            }
        }
    }
}