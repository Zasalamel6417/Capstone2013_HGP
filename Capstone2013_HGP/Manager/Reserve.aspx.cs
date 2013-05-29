using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone2013_HGP.Manager
{
    public partial class Reserve : System.Web.UI.Page
    {
        //Variable for number of tickets available
        int numAvail;

        protected void Page_Load(object sender, EventArgs e)
        {
           /* if (!IsPostBack)
            {
               numAvail = Convert.ToInt32(dvReservationInfo.Rows[8].Cells[1].Text);

                if (numAvail <= 0)
                {
                    txtQty.Visible = false;
                    btnReserve.Enabled = false;
                    btnReserve.Visible = false;
                    lblStatus.Text = "There are no more tickets Available for this event.";
                }
            } */

        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CapstoneSQLConn"].ToString()))
            {
                using(SqlCommand cmd = new SqlCommand("reserveTiks", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@quantity", SqlDbType.Int).Value = Convert.ToInt32(txtQty.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            MembershipUser mu = Membership.GetUser();

            if (mu != null)
            {

                string eventID = dvReservationInfo.Rows[0].Cells[1].Text;
                int quantity = Convert.ToInt32(txtQty.Text);
                numAvail = Convert.ToInt32(dvReservationInfo.Rows[14].Cells[1].Text);

                if (quantity > numAvail)
                {
                    lblStatus.Text = "Not enough tickets available.";
                }
                else
                {
                    Response.Redirect("~/Manager/Confirm.aspx?EventId=" + eventID + "&Qty=" + quantity.ToString() + "&sectionID=" + dvReservationInfo.Rows[11].Cells[1].Text);
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }


        }
    }
}